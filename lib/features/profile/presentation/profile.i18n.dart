import 'package:i18n_extension/i18n_extension.dart';

/// ===Profile_phone===
/// Constante: modificar datos
const kModifyData = 'kModifyData';

/// Constante: Mi perfil
const kMyProfile = 'kMyProfile';

/// Constante: Guardar
const kSave = 'kSave';

/// Constante: cerrar sesion
const kLogout = 'kLogout';

/// Constante: Ingrese su nombre
const kHintFirstName = 'kHintFirstName';

/// Constante: Ingrese su apellido
const kHintLastName = 'kHintLastName';

/// Constante: Ingrese su telefono
const kHintPhoneNumber = 'kHintPhoneNumber';

/// Cadenas de traduccion
extension ProfileStrings on String {
  static final _t = Translations.byId('en-US', {
    /// profile_phone
    kModifyData: {'en-US': 'Modify data', 'es': 'Modificar Datos'},
    kMyProfile: {'en-US': 'My Profile', 'es': 'Mi Perfil'},
    kSave: {'en-US': 'Save', 'es': 'Guardar'},
    kLogout: {'en-US': 'Logout', 'es': 'Cerrar sesión'},
    kHintFirstName: {
      'en-US': 'Enter your first name',
      'es': 'Ingrese su nombre',
    },
    kHintLastName: {
      'en-US': 'Enter your last name',
      'es': 'Ingrese su apellido',
    },
    kHintPhoneNumber: {
      'en-US': 'Enter your phone number',
      'es': 'Ingrese su numero celular',
    },
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
