import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/failures/bad_request.model.dart';
part 'http_failure.freezed.dart';

/// Clase para validar el tipo de error en una peticion http
@freezed
class HttpFailure with _$HttpFailure {
  /// Respuesta de error sobre la red
  factory HttpFailure.network() = _Network;

  /// Respuesta de error, que no encontro el recurso
  factory HttpFailure.notFound() = _NotFound;

  /// Respuesta de error sobre una falla en el codigo del servidor
  factory HttpFailure.server() = _Server;

  /// REspuesta de prohibicion al acceso por usuario inhabilitado
  factory HttpFailure.forbidden() = _Forbidden;

  /// Respuesta de error sobre no estar autorizado
  factory HttpFailure.unauthorized() = _Unauthorized;

  /// Respuesta mala de una peticion
  factory HttpFailure.badRequest(BadRequestModel dataError) = _BadRequest;

  /// Respuesta de error sobre el dispositivo
  factory HttpFailure.local() = _Local;
}
