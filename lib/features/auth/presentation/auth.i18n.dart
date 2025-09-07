import 'package:i18n_extension/i18n_extension.dart';

/// ===Auth_phone===
/// Constante: Marca
const kBrand = 'kBrand';

/// Constante: Titulo
const kTitle = 'kTitle';

/// Constante: Texto del titulo
const kSignInMessage = 'kSignInMessage';

/// Constante: Texto de hint para el telefono
const kEnterYourPhone = 'kEnterYourPhone';

/// Constante: Texto de hint para el correo
const kEnterYourEmail = 'kEnterYourEmail';

/// Constante: Texto de hint para el password
const kEnterYourPassword = 'kEnterYourPassword';

/// Constante: Texto de Login
const kLogin = 'kLogin';

/// Constante: Boton de Cerrar
const kClose = 'kClose';

/// Constante: Mensaje olvidaste tu contraseña?
const kForgotPassword = 'kForgotPassword';

/// Constante: Recuperar contraseña
const kRecoverPassword = 'kRecoverPassword';

/// Constante: No tienes una cuenta?Registrate
const kNotHaveAccount = 'kNotHaveAccount';

/// Constante: Mensaje de Bienvenida
const kLoginMessage = 'kLoginMessage';

/// Constante: O tu puedes
const kOrYouCan = 'kOrYouCan';

/// Constante: Texto del boton siguiente
const kNext = 'kNext';

/// Constante: Crear una cuenta
const kCreateAnAccount = 'kCreateAnAccount';

/// Constante: Mansaje por dejar espacios vacios
const kMessageEmptyFields = 'kMessageEmptyFields';

/// Constante: Mansaje por dejar el telefono vacio o con menos de 9 digitos
const kMessageEmptyPhone = 'kMessageEmptyPhone';

/// ===Create_Account===
/// Constante: Titulo de registro
const kTitleSignup = 'kTitleSignup';

/// Constante: Mensaje de registro
const kMessageSignUp = 'kMessageSignUp';

/// Constante: hint contraseña
const kPassword = 'kPassword';

/// Constante: hint correo
const kEmail = 'kEmail';

/// Constante: mensaje de error al dejar espacios vacios
const kMessageErrorCreateAccount = 'kMessageErrorCreateAccount';

/// Constante:  hit para el dropdown de moneda
const kHintDropDownCurrency = 'kHintDropDownCurrency';

/// Constante: hit para nombre completo
const kHintFullName = 'kHintFullName';

/// Constante: Titulo Lista de divisas
const kTitleListCurrency = 'kTitleListCurrency';

/// Constante: hint para el date of birth picker
const kHintDateBirthPicker = 'kHintDateBirthPicker';

/// Constante: message validation if is adult
const kMessageAdult = 'kMessageAdult';

/// ===Validate_otp_phone===
/// Constante: Titulo verify email
const kTitleVerifyEmail = 'kTitleVerifyEmail';

/// Constante: titulo de appbar
const kTitleValidateOtpPhone = 'kTitleValidateOtpPhone';

/// Constante: porfavor ingrese su codigo
const kMessageEnterYourCode = 'kMessageEnterYourCode';

/// Constante: porfavor ingrese su codigo
const kPleaseEnterYourCode = 'kPleaseEnterYourCode';

/// Constante: No recibiste un codigo?
const kDidntReceiveCode = 'kDidntReceiveCode';

/// Constante: reenviar
const kResend = 'kResend';

/// Constante: Puede reenviar nuevamente en x tiempo
const kCanResendIn = 'kCanResendIn';

/// ===Create_new_password===
/// Constante: Titulo create new password
const kTitleCreateNewPassword = 'kTitleCreateNewPassword';

/// Constante: Mensaje para crear una contraseña
const kMessageYourNewPassword = 'kMessageYourNewPassword';

/// Constante: Ingrese su nueva contraseña
const kEnterYourNewPassword = 'kEnterYourNewPassword';

/// Constante: Repita su nueva contraseña
const kRepeatYourNewPassword = 'kRepeatYourNewPassword';

/// Constante: Boton guardar
const kSave = 'kSave';

/// Constante: Contraseñas no son iguales
const kPasswordsNotMatch = 'kPasswordsNotMatch';

/// Constante: La contraseña debe tener minimo 8 digitos
const kMinDigitPassword = 'kMinDigitPassword';

/// ===Register_information_phone===
/// Constante: titulo de appbar
const kTitleRegisterInformationPhone = 'kTitleRegisterInformationPhone';

/// Constante: Boton registrar
const kRegister = 'kRegister';

/// Constante: Nombres
const kFirstName = 'kFirstName';

/// Constante: Apellidos
const kLastName = 'kLastName';

/// Constante: Cancelar
const kCancel = 'kCancel';

/// Constante: Vivo en Peru
const kLiveInPeru = 'kLiveInPeru';

/// Constante: Departamento
const kDepartment = 'kDepartment';

/// Constante: Selccione su departamento
const kSelectYourDepartment = 'kSelectYourDepartment';

/// Constante: Provincia
const kProvince = 'kProvince';

/// Constante: Seleccione su provincia
const kSelectYourProvince = 'kSelectYourProvince';

/// Constante: Distrito
const kDistrict = 'kDistrict';

/// Constante: Seleccione su distrito
const kSelectYourDistrict = 'kSelectYourDistrict';

/// Constante: Se olvido seleccionar su distrito
const kForgotSelectedYourDisctrict = 'kForgotSelectedYourDisctrict';

/// Constante: Acepto los terminos y condiciones
const kHasAcceptedTerms = 'kHasAcceptedTerms';

/// constante: Mensaje de error, aceptar los termino sy condiciones
const kTermsMessageError = 'kTermsMessageError';

/// Constante: Mensaje de requerimiento de informacion del usuario
const kMessageRequireInformation = 'kMessageRequireInformation';

/// Constante: Mensa de recuperacion de contraseña
const kMessageForgotPassword = 'kMessageForgotPassword';

/// Constante: Mensaje de error
const kRegisterMessageError = 'kRegisterMessageError';

/// ===Forgot_password===
/// Constante: Titulo olvide mi contraseña
const kTitleForgotPassword = 'kTitleForgotPassword';

/// Constante: Mensaje para ingresar el correo
const kRecieveVerificationCode = 'kRecieveVerificationCode';

/// Constante: Enviar correo
const kSendEmail = 'kSendEmail';

/// Constante: Titulo de modal de alerta
const kAlert = 'kAlert';

/// Cadenas de traduccion
extension AuthStrings on String {
  static final _t = Translations.byId('en-US', {
    /// Auth_phone
    kBrand: {'en-US': 'Pringstom_en', 'es': 'Pringstom_es'},
    kTitle: {'en-US': 'Let us begin', 'es': 'Comencemos'},
    kSignInMessage: {
      'en-US': 'Please, enter your account',
      'es': 'Por favor, ingrese su cuenta',
    },
    kEnterYourPhone: {
      'en-US': 'Enter your phone number',
      'es': 'Ingrese su celular',
    },
    kEnterYourEmail: {
      'en-US': 'Enter your email address',
      'es': 'Ingrese su correo electronico',
    },
    kEnterYourPassword: {
      'en-US': 'Enter your password',
      'es': 'Ingrese su contraseña',
    },
    kLogin: {'en-US': 'Login', 'es': 'Iniciar Sesión'},
    kClose: {'en-US': 'Close', 'es': 'Cerrar'},
    kForgotPassword: {
      'en-US': 'Forgot password?',
      'es': 'Olvidaste tu contraseña?',
    },
    kRecoverPassword: {
      'en-US': 'Recover password',
      'es': 'Recuperar contraseña',
    },
    kNotHaveAccount: {
      'en-US': "Don't have an account? !Sign up!",
      'es': 'No tienes una cuenta? ¡Registrate!',
    },
    kLoginMessage: {
      'en-US': 'Please, enter your email and password',
      'es': 'Por favor, ingrese su correo y contraseña',
    },
    kOrYouCan: {'en-US': 'Or you can', 'es': 'O puedes'},
    kCreateAnAccount: {'en-US': 'Create an account', 'es': 'Crear una cuenta'},
    kNext: {'en-US': 'Next', 'es': 'Siguiente'},
    kMessageEmptyFields: {
      'en-US': 'Do not leave any spaces blank, all fields are mandatory.',
      'es': 'No deje espacios vacios, todos los campos son obligatorios',
    },
    kMessageEmptyPhone: {
      'en-US': 'The phone number must be at least 9 digits long.',
      'es': 'El numero de celular debe tener al menos 9 digitos.',
    },

    /// Create_Account
    kTitleSignup: {'en-US': 'Sign Up', 'es': 'Nuevo registro'},
    kMessageSignUp: {
      'en-US': 'Register your information to create a new account.',
      'es': 'Registro sus datos para crear una nueva cuenta',
    },
    kEmail: {'en-US': 'Email', 'es': 'Correo electronico'},
    kMessageErrorCreateAccount: {
      'en-US': 'All fields are required',
      'es': 'Todos los campos son obligatorios, no deje espacios en blanco',
    },
    kPassword: {'en-US': 'Password', 'es': 'Contraseña'},
    kHintDropDownCurrency: {
      'en-US': 'Select your currency',
      'es': 'Seleccione su divisa',
    },
    kHintFullName: {
      'en-US': 'Enter your full name',
      'es': 'Ingrese su nombre completo',
    },
    kTitleListCurrency: {'en-US': 'List currency', 'es': 'Lista de divisas'},
    kHintDateBirthPicker: {
      'en-US': 'Enter your date of birth',
      'es': 'Ingrese su fecha de nacimiento',
    },
    kMessageAdult: {
      'en-US': 'You must be an adult to register',
      'es': 'Debes ser mayor de edad para registrarte',
    },

    /// Validate_otp
    kTitleVerifyEmail: {
      'en-US': 'Verify your email',
      'es': 'Verifique su correo',
    },
    kTitleValidateOtpPhone: {
      'en-US': 'Verify your phone',
      'es': 'Verifique su numero',
    },
    kMessageEnterYourCode: {
      'en-US': 'We send an email to: %s\n please enter your code',
      'es': 'Le enviamos un correo al: %s\n por favor ingrese su codigo',
    },
    kPleaseEnterYourCode: {
      'en-US': 'We send an SMS to: %s\n please enter your code',
      'es': 'Le enviamos un sms al: %s\n por favor ingrese su codigo',
    },
    kDidntReceiveCode: {
      'en-US': "Didn't receive a code?",
      'es': 'No recibiste un codigo?',
    },
    kResend: {'en-US': 'Resend', 'es': 'Reenviar'},
    kCanResendIn: {
      'en-US': 'You can resend again in: %s',
      'es': 'Podras reenviar nuevamente en: %s',
    },

    /// Create new password
    kTitleCreateNewPassword: {
      'en-US': 'Create new password',
      'es': 'Crear nueva contraseña',
    },
    kMessageYourNewPassword: {
      'en-US':
          'Please enter your new password, it must be different from the '
          'previously used password.',
      'es':
          'Por favor ingrese su nueva contraseña, esta debe ser diferente '
          'a la contraseña utilizada anteriormente.',
    },
    kEnterYourNewPassword: {
      'en-US': 'Enter your new password',
      'es': 'Ingrese su nueva contraseña',
    },
    kRepeatYourNewPassword: {
      'en-US': 'Repeat your new password',
      'es': 'Repita su nueva contraseña',
    },
    kSave: {'en-US': 'Save', 'es': 'Guardar'},
    kPasswordsNotMatch: {
      'en-US':
          'The passwords do not match, please ensure the passwords are '
          'identical.',
      'es':
          'Las contraseñas no coiciden, por favor las contraseñas '
          'deben ser iguales.',
    },
    kMinDigitPassword: {
      'en-US':
          'The password is invalid, it must be at least 8 characters long.',
      'es': 'La contraseña es inválida, debe tener al menos 8 caracteres.',
    },

    /// register_information_phone
    kTitleRegisterInformationPhone: {
      'en-US': 'Register information',
      'es': 'Registro de información',
    },
    kRegister: {'en-US': 'Register', 'es': 'Registrar'},
    kFirstName: {'en-US': 'Enter your first name', 'es': 'Ingrese sus nombres'},
    kLastName: {'en-US': 'Enter your last name', 'es': 'Ingrese sus apellidos'},

    kLiveInPeru: {'en-US': 'I live in Perú', 'es': 'Vivo en Perú'},
    kCancel: {'en-US': 'Cancel', 'es': 'Cancelar'},
    kDepartment: {'en-US': 'Department', 'es': 'Departamento'},
    kSelectYourDepartment: {
      'en-US': 'Select your department',
      'es': 'Seleccione su departamento',
    },
    kProvince: {'en-US': 'Province', 'es': 'Provincia'},
    kSelectYourProvince: {
      'en-US': 'Select your province',
      'es': 'Seleccione su provincia',
    },
    kDistrict: {'en-US': 'District', 'es': 'Distrito'},
    kSelectYourDistrict: {
      'en-US': 'Select your district',
      'es': 'Seleccione su distrito',
    },
    kForgotSelectedYourDisctrict: {
      'en-US': 'You forgot to select your district',
      'es': 'Se olvido de seleccionar su distrito',
    },
    kHasAcceptedTerms: {
      'en-US': 'I accept the terms and conditions.',
      'es': 'Acepto los terminos y condiciones.',
    },
    kMessageRequireInformation: {
      'en-US': '''
The following information is required 
for the correct functioning of the application''',
      'es': '''
La siguiente informacion es requerida para
el correcto funcionamiento de la aplicacion''',
    },
    kMessageForgotPassword: {
      'en-US': '''
please enter your email address to recieve a verification link''',
      'es': '''
Por favor ingrese su direccion de correo electrónico
para recibir un enlace de recuperación''',
    },
    kRegisterMessageError: {
      'en-US':
          'all the fields'
          ' are mandatory for registration.',
      'es': 'Todos los campos son obligatorios para registrarte',
    },
    kTermsMessageError: {
      'en-US':
          'It is required to accept the terms '
          'and conditions for your registration.',
      'es': 'Es requerido aceptar los terminos y condiciones para su registro',
    },
    kAlert: {'en-US': 'Alert', 'es': 'Atencion'},

    /// Forgot password
    kTitleForgotPassword: {
      'en-US': 'Forgot password',
      'es': 'Olvide mi contraseña',
    },
    kRecieveVerificationCode: {
      'en-US': 'Please enter your email address to recieve a verification code',
      'es':
          'Por favor ingrese su correo para recibir un codigo '
          'de verificacion',
    },
    kSendEmail: {'en-US': 'Send email', 'es': 'Enviar correo'},
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
