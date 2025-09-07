import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/domain/entities/profile.entity.dart';
import 'package:way24/features/profile/data/datasources/remote/profile.datasource.dart';
import 'package:way24/features/profile/domain/repositories/profile.repository.dart';

/// Profile repository implements
class ProfileRepositoryImpl implements ProfileRepository {
  /// Profile repository implements
  ProfileRepositoryImpl({required this.profileDatasource});

  /// profile datasource
  final ProfileDatasource profileDatasource;

  @override
  FutureEither<HttpFailure, ProfileEntity> getProfileData() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return profileDatasource.getProfiledata();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, void> logout() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return profileDatasource.logout();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, void> saveProfile({
    required String firstName,
    required String lastName,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return profileDatasource.saveProfile(
        firstName: firstName,
        lastName: lastName,
      );
    } else {
      return Either.left(HttpFailure.network());
    }
  }
}
