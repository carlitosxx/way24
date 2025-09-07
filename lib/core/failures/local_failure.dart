import 'package:freezed_annotation/freezed_annotation.dart';
part 'local_failure.freezed.dart';

/// Class for validate type error local data source
@freezed
class LocalFailure with _$LocalFailure {
  /// failure in device to save in SharePreference
  factory LocalFailure.sharedPreferences() = _SharedPreferences;
}
