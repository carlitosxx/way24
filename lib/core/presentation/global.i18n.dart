import 'package:i18n_extension/i18n_extension.dart';

/// ===Global===
/// ===Utils===
/// Constante: Hoy
const kToday = 'kToday';

/// Constante: Pronto
const kUpcomming = 'kUpcomming';

/// Constante: ya paso
const kPassed = 'kPassed';

/// ===========
/// Constante: Marca
const kWarning = 'kWarning';

/// Constante: Alerta
const kAlert = 'kAlert';

/// Constante: Mensaje de error cuando no tiene conexion
const kNoNetworkMessage = 'kNoNetworkMessage';

/// Constante: Contenido no encontrado
const kNotFoundMessage = 'kNotFound';

/// Constante: Error en el servidor
const kServerMessage = 'kServerError';

/// Constante: Error de autorizacion
const kUnauthorizedMessage = 'kUnauthorizedMessage';

/// Constante: ERror para usuarios Inhabilitados
const kForbiddenMessage = 'kForbiddenMessage';

/// Constante: Error en el codigo del frontend(movil) o desconocido
const kLocal = 'kLocal';

/// Constante: Error badrequest:Hubo un problema al recibir el mensaje de error
const kNotMessageError = 'kNotMessageError';

/// Constante: Boton de Cerrar
const kClose = 'lClose';

/// ===Exceptions===
/// AuthApiException
/// Constante: Error de credenciales invalidas
const kInvalidCredencials = 'kInvalidCredencials';

/// Constante: Correo no confirmado
const kEmailNotConfirmed = 'kEmailNotConfirmed';

/// Constante: Token expirado
const kExpiredToken = 'kExpiredToken';

/// Constante: Usuario no encontrado
const kuserNotFound = 'kuserNotFound';

/// Constante: El correo ya se encuentra registrado
const kEmailAlreadyRegistered = 'kEmailAlreadyRegistered';

/// Constante: El correo es invalido
const kEmailInvalid = 'kEmailInvalid';

/// Constante: La contraseña no cumple con los requisitos de seguridad.
const kPasswordTooWeak = 'kPasswordTooWeak';

/// Constante: Acceso denegado
const kAccesDenied = 'kAccesDenied';

/// Constante: El correo no puede ser usado ya que no estas autorizado
const kEmailNotAuthorized = 'kEmailNotAuthorized';

/// Constante: has superado el límite de envío de correos electrónicos
const kOverEmailSendRateLimit = 'kOverEmailSendRateLimit';

/// Constante: el codigo otp es invalido
const kOtpExpiredOrInvalid = 'kOtpExpiredOrInvalid';

/// Constante: El password debe ser diferente a la anterior
const kSomePassword = 'kSomePassword';

/// ==Week day===
/// Constante: Lunes
const kMonday = 'kMonday';

/// Constante: Martes
const kTuesday = 'kTuesday';

/// Constante: Miercoles
const kWednesday = 'kWednesday';

/// Constante: Jueves
const kThursday = 'kThursday';

/// Constante: Viernes
const kFriday = 'kFriday';

/// Constante: Sabado
const kSaturday = 'kSaturday';

/// Constante: Domingo
const kSunday = 'kSunday';

/// Constante: dia invalido
const kInvalidDay = 'kInvalidDay';

/// Cadenas de traduccion
extension GlobalStrings on String {
  static final _t = Translations.byId('en-US', {
    //==Utils==
    kToday: {'en-US': 'Today', 'es': 'Hoy'},
    kUpcomming: {'en-US': 'Soon', 'es': 'Pronto'},
    kPassed: {'en-US': 'Passed', 'es': 'Finalizo'},
    kWarning: {'en-US': '¡Warning!', 'es': '¡Advertencia!'},
    kAlert: {'en-US': 'Alert', 'es': 'Atencion'},
    kNoNetworkMessage: {
      'en-US':
          'There was a problem with your internet connection, '
          'please check your network and try again.',
      'es':
          'Hubo un problema en la conexión de tu internet, '
          'por favor comprueba tu red e intente nuevamente.',
    },
    kNotFoundMessage: {
      'en-US': 'The requested resource was not found.',
      'es': 'El recurso solicitado no fue encontrado.',
    },
    kServerMessage: {
      'en-US': 'There was a problem on the server, please contact us.',
      'es':
          'Hubo un problema en el servidor, '
          'por favor contáctese con nosotros.',
    },
    kUnauthorizedMessage: {
      'en-US':
          'You are not authenticated to view this resource, please log in.',
      'es':
          'No estas autenticado para ver este recurso, '
          'por favor identifiquese',
    },
    kForbiddenMessage: {
      'en-US': 'Your account has been disabled, contact support.',
      'es': 'Su cuenta ha sido inhabilitada, contacte al area de soporte',
    },
    kLocal: {
      'en-US': 'There was a local or unknown problem, please contact us.',
      'es': 'Hubo un problema local o desconocido, por favor contáctenos.',
    },
    kNotMessageError: {
      'en-US': 'There was a problem receiving the error message.',
      'es': 'Hubo un problema al recibir el mensaje de error.',
    },
    kClose: {'en-US': 'Close', 'es': 'Cerrar'},
    kInvalidCredencials: {
      'en-US': 'Incorrect credentials, please enter a valid account.',
      'es': 'Credenciales incorrectas, por favor ingrese una cuenta valida.',
    },
    kEmailNotConfirmed: {
      'en-US': 'Email not confirmed, please check your email.',
      'es': 'Correo no confirmado, por favor revise su correo.',
    },
    kExpiredToken: {
      'en-US': 'Token expired, please log in again.',
      'es': 'Token expirado, por favor vuelva a identificarse.',
    },
    kuserNotFound: {
      'en-US': 'User not found, please enter a valid account.',
      'es': 'Usuario no encontrado, por favor ingrese una cuenta valida',
    },
    kEmailAlreadyRegistered: {
      'en-US':
          'The email is already registered, '
          'please enter a different email.',
      'es':
          'El correo ya se encuentra registrado, '
          'por favor ingrese otro correo',
    },
    kEmailInvalid: {
      'en-US':
          'The email address is invalid, please enter a valid email address.',
      'es':
          'La dirección de correo electrónico es inválida, '
          'por favor ingrese una dirección de correo electrónico válida.',
    },
    kPasswordTooWeak: {
      'en-US': 'The password is not secure, please enter a secure password.',
      'es':
          'La contraseña no es segura, '
          'por favor ingrese una contraseña segura',
    },
    kAccesDenied: {
      'en-US':
          'Access denied, '
          'the role you have been assigned cannot access this resource.',
      'es':
          'Acceso denegado, '
          'El rol que tiene asignado no puede acceder a este recurso',
    },
    kEmailNotAuthorized: {
      'en-US':
          'Access denied, '
          'the email cannot be used as you are not authorized.',
      'es':
          'Acceso denegado, El correo electrónico '
          'no puede ser usado ya que no estas autorizado.',
    },
    kOverEmailSendRateLimit: {
      'en-US':
          'You have exceeded the email sending limit in a short period '
          'of time, please wait a few minutes and try again.',
      'es':
          'Has superado el limite de envió de correos electrónicos '
          'en un corto periodo de tiempo, por favor espera unos minutos y '
          'vuelve a intentarlo.',
    },
    kOtpExpiredOrInvalid: {
      'en-US': 'The OTP code is invalid or has expired.',
      'es': 'El código OTP es inválido o ha expirado.',
    },
    kSomePassword: {
      'en-US': 'New password should be different from the old password.',
      'es': 'La nueva contraseña debe ser diferente de la contraseña anterior.',
    },
    kMonday: {'en-US': 'Monday', 'es': 'Lunes'},
    kTuesday: {'en-US': 'Tuesday', 'es': 'Martes'},
    kWednesday: {'en-US': 'Wednesday', 'es': 'Miercoles'},
    kThursday: {'en-US': 'Thursday', 'es': 'Jueves'},
    kFriday: {'en-US': 'Friday', 'es': 'Viernes'},
    kSaturday: {'en-US': 'Saturday', 'es': 'Sabado'},
    kSunday: {'en-US': 'Sunday', 'es': 'Domingo'},
    kInvalidDay: {'en-US': 'Invalid day', 'es': 'Dia invalido'},
  });

  /// Getter to translate the string
  String get i18n => localize(this, _t);

  /// Method for interpolating strings
  String fill(List<Object> params) => localizeFill(this, params);

  /// Method for pluralizing strings
  String plural(int value) => localizePlural(value, this, _t);

  /// Method for creating custom modifiers according to any conditions
  String version(Object modifier) => localizeVersion(modifier, this, _t);

  /// Method for retrieving all the custom modifiers
  Map<String?, String> allVersions() => localizeAllVersions(this, _t);
}
