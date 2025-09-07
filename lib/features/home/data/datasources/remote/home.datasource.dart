import 'package:latlong2/latlong.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/bad_request.model.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/utils/throw_exception.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/data/models/category.model.dart';
import 'package:way24/features/home/data/models/crew.model.dart';
import 'package:way24/features/home/data/models/crew_detail.model.dart';
import 'package:way24/features/home/data/models/tourist_package.model.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';

/// Data datasource
abstract interface class HomeDatasource {
  /// get categories
  FutureEither<HttpFailure, List<CategoryEntity>> getCategories();

  /// get Crews
  FutureEither<HttpFailure, List<CrewEntity>> getCrews();

  /// get detail crew
  FutureEither<HttpFailure, CrewDetailEntity> getDetailCrew(String id);

  /// get user location stream
  StreamEither<HttpFailure, LatLng> getUserLocationStream(String userId);

  /// get tourist packages
  FutureEither<HttpFailure, List<TouristPackageEntity>> getTouristPackages(
    String userId,
  );
}

/// Datasource implementation
class HomeDatasourceImpl implements HomeDatasource {
  /// Datasource implementation
  HomeDatasourceImpl({required Supabase supabase}) : _supabase = supabase;

  final Supabase _supabase;

  @override
  FutureEither<HttpFailure, List<CategoryEntity>> getCategories() async {
    try {
      final categoriesResponse = await _supabase.client
          .from('categories')
          .select()
          .order('order', ascending: true);
      final listCategories = categoriesResponse
          .map<CategoryEntity>(CategoryModel.fromMap)
          .toList();
      return Either.right(listCategories);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, List<CrewEntity>> getCrews() async {
    try {
      final crewsResponse = await _supabase.client
          .from('crews')
          .select(
            'id,name,image_url,date_start,date_end,district:district(name)',
          );

      final listCrews = crewsResponse
          .map<CrewEntity>(CrewModel.fromMap)
          .toList();
      final listOrdered = orderListCrews(listCrews);
      return Either.right(listOrdered);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, CrewDetailEntity> getDetailCrew(String id) async {
    try {
      final detailCrewResponse = await _supabase.client
          .from('crews')
          .select(
            'id,name,image_url,date_start,date_end,date_fundation,founders,'
            'characters,district:district(name),'
            'events:events_crew(date,order,title,address,latitude,'
            'longitude),responsible',
          )
          .eq('id', id);
      if (detailCrewResponse.isNotEmpty) {
        final detailCrew = CrewDetailModel.fromMap(detailCrewResponse.first);
        return Either.right(detailCrew);
      } else {
        return Either.left(HttpFailure.notFound());
      }
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  StreamEither<HttpFailure, LatLng> getUserLocationStream(
    String userId,
  ) async* {
    try {
      final stream = _supabase.client
          .from('responsibles_crew')
          .stream(primaryKey: ['id'])
          .eq('id', userId)
          .limit(1);
      yield* stream.map((data) {
        if (data.isNotEmpty) {
          final latitude = data.first['latitude'] as double?;
          final longitude = data.first['longitude'] as double?;
          if (latitude != null && longitude != null) {
            return Either.right(LatLng(latitude, longitude));
          } else {
            return Either.left(
              HttpFailure.badRequest(
                BadRequestModel(
                  statusCode: 404,
                  error: 'Latitude or longitude is null',
                  message: ['Latitude or longitude is null'],
                ),
              ),
            );
          }
        } else {
          return Either.left(
            HttpFailure.badRequest(
              BadRequestModel(
                statusCode: 404,
                error: 'User responsible not found',
                message: ['User responsible not found'],
              ),
            ),
          );
        }
      });
    } catch (ex) {
      yield Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, List<TouristPackageEntity>> getTouristPackages(
    String userId,
  ) async {
    try {
      final touristPackagesResponse = await _supabase.client
          .rpc<List<Map<String, dynamic>>>(
            'get_tourist_packages',
            params: {'p_user_id': userId},
          );

      final listTouristPackages = touristPackagesResponse
          .map<TouristPackageEntity>(TouristPackageModel.fromMap)
          .toList();

      return Either.right(listTouristPackages);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }
}

/// Methods
List<CrewEntity> orderListCrews(List<CrewEntity> listCrews) {
  final now = DateTime.now().toUtc().subtract(const Duration(hours: 5));

  final todayCrews = listCrews.where((crew) {
    return crew.dateStart.isBefore(now) && crew.dateEnd.isAfter(now);
  }).toList();

  final futureCrews = listCrews.where((crew) {
    return crew.dateStart.isAfter(now);
  }).toList();

  final pastCrews = listCrews.where((crew) {
    return crew.dateEnd.isBefore(now);
  }).toList();

  todayCrews.sort((a, b) => a.dateStart.compareTo(b.dateStart));
  futureCrews.sort((a, b) => a.dateStart.compareTo(b.dateStart));
  pastCrews.sort((a, b) => a.dateStart.compareTo(b.dateStart));
  return [...todayCrews, ...futureCrews, ...pastCrews];
}
