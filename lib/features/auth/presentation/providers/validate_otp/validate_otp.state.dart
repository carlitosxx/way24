import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'validate_otp.state.freezed.dart';

/// validate otp state
@freezed
abstract class ValidateOtpState with _$ValidateOtpState {
  /// Data is present state
  const factory ValidateOtpState.data({required String data}) = _Data;

  /// Initial/default state
  const factory ValidateOtpState.initial() = _Initial;

  /// Data is loading state
  const factory ValidateOtpState.loading() = _Loading;

  /// Error when loading data state
  const factory ValidateOtpState.error(ErrorMapping error) = _Error;
}
