import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';
part 'get_current_session.state.freezed.dart';

@freezed
/// Represents the state for the GetCurrentSession use case.
abstract class GetCurrentSessionState with _$GetCurrentSessionState {
  /// State when the data is successfully retrieved.
  const factory GetCurrentSessionState.data({required UserEntity userEntity}) =
      _Data;

  /// Initial/default state before any action has been taken.
  const factory GetCurrentSessionState.initial() = _Initial;

  /// State when the data is currently being loaded.
  const factory GetCurrentSessionState.loading() = _Loading;

  /// State when an error occurs while loading the data.
  /// The error is represented by an `ErrorMapping` instance.
  const factory GetCurrentSessionState.error(ErrorMapping error) = _Error;
}
