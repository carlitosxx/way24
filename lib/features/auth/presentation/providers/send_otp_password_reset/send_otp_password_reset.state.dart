import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'send_otp_password_reset.state.freezed.dart';

/// Represents the different states of the process for sending an OTP
/// (One-Time Password) for password reset.
@freezed
abstract class SendOtpPasswordResetState with _$SendOtpPasswordResetState {
  /// Data is present state
  const factory SendOtpPasswordResetState.data() = _Data;

  /// Initial/default state
  const factory SendOtpPasswordResetState.initial() = _Initial;

  /// Data is loading state
  const factory SendOtpPasswordResetState.loading() = _Loading;

  /// Error when loading data state
  const factory SendOtpPasswordResetState.error(ErrorMapping error) = _Error;
}
