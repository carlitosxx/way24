import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'get_onboarding_status.state.freezed.dart';

/// get onboarding status state
@freezed
abstract class GetOnboardingStatusState with _$GetOnboardingStatusState {
  /// Data is present state
  const factory GetOnboardingStatusState.data({required bool status}) = _Data;

  /// Initial/default state
  const factory GetOnboardingStatusState.initial() = _Initial;

  /// Data is loading state
  const factory GetOnboardingStatusState.loading() = _Loading;

  /// Error when loading data state
  const factory GetOnboardingStatusState.error(ErrorMapping error) = _Error;
}
