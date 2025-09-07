import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'create_new_account.state.freezed.dart';

///create new account state
@freezed
abstract class CreateNewAccountState with _$CreateNewAccountState {
  /// Data is present state
  const factory CreateNewAccountState.data() = _Data;

  /// Initial/default state
  const factory CreateNewAccountState.initial() = _Initial;

  /// Data is loading state
  const factory CreateNewAccountState.loading() = _Loading;

  /// Error when loading data state
  const factory CreateNewAccountState.error(ErrorMapping error) = _Error;
}
