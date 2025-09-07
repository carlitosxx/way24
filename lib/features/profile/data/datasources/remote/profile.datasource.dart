import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/utils/throw_exception.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/data/models/profile.model.dart';
import 'package:way24/features/profile/domain/entities/profile.entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Profile interface data source
abstract interface class ProfileDatasource {
  /// logout
  FutureEither<HttpFailure, void> logout();

  /// get profile data
  FutureEither<HttpFailure, ProfileEntity> getProfiledata();

  /// save profile data
  FutureEither<HttpFailure, void> saveProfile({
    required String firstName,
    required String lastName,
  });
}

/// Profile data source implements
class ProfileDatasourceImpl implements ProfileDatasource {
  /// Profile Data source implements
  ProfileDatasourceImpl({required Supabase supabase}) : _supabase = supabase;
  final Supabase _supabase;

  @override
  FutureEither<HttpFailure, void> logout() async {
    try {
      await _supabase.client.auth.signOut();
      return Either.right(null);
    } on Exception catch (_) {
      return Either.left(HttpFailure.server());
    }
  }

  @override
  FutureEither<HttpFailure, ProfileEntity> getProfiledata() async {
    try {
      final currentSession = _supabase.client.auth.currentSession;
      final idUser = currentSession?.user.id;
      if (idUser == null) {
        return Either.left(HttpFailure.forbidden());
      }
      final userProfileRaw = await _supabase.client
          .from('profiles')
          .select()
          .eq('id', idUser);
      final userProfile = ProfileModel.fromMap(userProfileRaw.first);
      return Either.right(userProfile);
      // return
    } on Exception catch (_) {
      return Either.left(HttpFailure.server());
    }
  }

  @override
  FutureEither<HttpFailure, void> saveProfile({
    required String firstName,
    required String lastName,
  }) async {
    try {
      final currentSession = _supabase.client.auth.currentSession;
      final idUser = currentSession?.user.id;
      if (idUser == null) {
        return Either.left(HttpFailure.forbidden());
      }
      await _supabase.client
          .from('profiles')
          .update({
            'first_name': firstName.trim(),
            'last_name': lastName.trim(),
          })
          .eq('id', idUser);

      return Either.right(null);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }
}
