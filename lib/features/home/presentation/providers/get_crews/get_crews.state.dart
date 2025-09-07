import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
part 'get_crews.state.freezed.dart';

/// get crews states
@freezed
abstract class GetCrewsState with _$GetCrewsState {
  /// Data is present state
  const factory GetCrewsState.data({required List<CrewEntity> listCrews}) =
      _Data;

  /// Initial/default state
  const factory GetCrewsState.initial() = _Initial;

  /// Data is loading state
  const factory GetCrewsState.loading() = _Loading;

  /// Error when loading data state
  const factory GetCrewsState.error(ErrorMapping error) = _Error;
}
