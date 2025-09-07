import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';

part 'create_new_password.state.freezed.dart';

/// create new password state
@freezed
abstract class CreateNewPasswordState with _$CreateNewPasswordState {
  /// Data is present state
  const factory CreateNewPasswordState.data(String id) = _Data;

  /// Initial/default state
  const factory CreateNewPasswordState.initial() = _Initial;

  /// Data is loading state
  const factory CreateNewPasswordState.loading() = _Loading;

  /// Error when loading data state
  const factory CreateNewPasswordState.error(ErrorMapping error) = _Error;
}
