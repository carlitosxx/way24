import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';
part 'get_detail_crew_by_id.state.freezed.dart';

/// Get state of detail crew by id
@freezed
abstract class GetDetailCrewByIdState with _$GetDetailCrewByIdState {
  /// Data is present state
  const factory GetDetailCrewByIdState.data({
    required CrewDetailEntity crewDetailEntity,
  }) = _Data;

  /// Initial/default state
  const factory GetDetailCrewByIdState.initial() = _Initial;

  /// Data is loading state
  const factory GetDetailCrewByIdState.loading() = _Loading;

  /// Error when loading data state
  const factory GetDetailCrewByIdState.error(ErrorMapping error) = _Error;
}
