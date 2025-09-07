import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'get_user_location_stream.state.freezed.dart';

/// state get user location stream
@freezed
abstract class GetUserLocationStreamState with _$GetUserLocationStreamState {
  /// Data is present state
  const factory GetUserLocationStreamState.data({required LatLng latlng}) =
      _Data;

  /// Initial/default state
  const factory GetUserLocationStreamState.initial() = _Initial;

  /// Data is loading state
  const factory GetUserLocationStreamState.loading() = _Loading;

  /// Error when loading data state
  const factory GetUserLocationStreamState.error(ErrorMapping error) = _Error;
}
