import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';

part 'logout.state.freezed.dart';

/// States for logout
@freezed
abstract class LogoutState with _$LogoutState {
  /// Data is present state
  const factory LogoutState.data() = _Data;

  /// Initial/default state
  const factory LogoutState.initial() = _Initial;

  /// Data is loading state
  const factory LogoutState.loading() = _Loading;

  /// Error when loading data state
  const factory LogoutState.error(ErrorMapping error) = _Error;
}
