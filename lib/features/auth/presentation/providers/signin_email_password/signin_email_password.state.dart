import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';
part 'signin_email_password.state.freezed.dart';

///Sign in with email and password
@freezed
abstract class SignInEmailPasswordState with _$SignInEmailPasswordState {
  /// Data is present state
  const factory SignInEmailPasswordState.data({required UserEntity user}) =
      _Data;

  /// Initial/default state
  const factory SignInEmailPasswordState.initial() = _Initial;

  /// Data is loading state
  const factory SignInEmailPasswordState.loading() = _Loading;

  /// Error when loading data state
  const factory SignInEmailPasswordState.error(ErrorMapping error) = _Error;
}
