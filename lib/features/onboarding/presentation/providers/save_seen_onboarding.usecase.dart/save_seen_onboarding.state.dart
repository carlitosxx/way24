import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'save_seen_onboarding.state.freezed.dart';

/// State
@freezed
abstract class SaveSeenOnboardingState with _$SaveSeenOnboardingState {
  /// Data is present state
  const factory SaveSeenOnboardingState.data() = _Data;

  /// Initial/default state
  const factory SaveSeenOnboardingState.initial() = _Initial;

  /// Data is loading state
  const factory SaveSeenOnboardingState.loading() = _Loading;

  /// Error when loading data state
  const factory SaveSeenOnboardingState.error(ErrorMapping error) = _Error;
}
