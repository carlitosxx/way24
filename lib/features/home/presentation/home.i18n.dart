import 'package:i18n_extension/i18n_extension.dart';

/// ===Home_phone===
/// Constante: Marca
const kBrand = 'kBrand';

/// Constante: Inicio
const kHome = 'kHome';

/// Constante: Perfil
const kProfile = 'kProfile';

/// ===Home_detail===
/// Constante: Categoria
const kCategories = 'kCategories';

/// Constante: Ver todo
const kSeeAll = 'kSeeAll';

/// Constante: Lista de cuadrillas
const kListCrew = 'kListCrew';

/// ===Detail crew===
/// Constante: Fundado en el año %s en %s
const kFoundedInTheYearIn = 'kFoundedInTheYearIn';

/// Constante: Fundador
const kFounders = 'kFounders';

/// Constante: Danzantes
const kDancers = 'kDancers';

/// Constante: Eventos
const kEvents = 'kEvents';

/// ===Menu Home===

/// Constante: Mi Perfil
const kMyProfile = 'kMyProfile';

/// Constante: Mis Compras
const kMyPurchases = 'kMyPurchases';

/// Constante: Preguntas frecuentes
const kFAQ = 'kFAQ';

/// Constante: Libro de reclamaciones
const kComplaintsBook = 'kComplaintsBook';

/// Constante: Cerrar sesión
const kCloseSession = 'kCloseSession';

/// Cadenas de traduccion
extension HomeStrings on String {
  static final _t = Translations.byId('en-US', {
    /// Home_phone
    kBrand: {'en-US': 'Pringstom_en', 'es': 'Pringstom_es'},
    kHome: {'en-US': 'Home', 'es': 'Inicio'},
    kProfile: {'en-US': 'Profile', 'es': 'Perfil'},

    kCategories: {'en-US': 'Categories', 'es': 'Categorias'},
    kSeeAll: {'en-US': 'See All', 'es': 'Ver todo'},
    kListCrew: {'en-US': 'List crew', 'es': 'Lista de cuadrillas'},

    /// Detail_crew_phone
    kFoundedInTheYearIn: {
      'en-US': 'Founded in the year %s in %s',
      'es': 'Fundado en el año %s en %s',
    },
    kFounders: {'en-US': 'Founders:', 'es': 'Fundadores:'},
    kDancers: {'en-US': 'Dancers:', 'es': 'Danzantes:'},
    kEvents: {'en-US': 'Events:', 'es': 'Eventos:'},

    /// Menu Home
    kMyProfile: {'en-US': 'My profile', 'es': 'Mi perfil'},
    kMyPurchases: {'en-US': 'My purchases', 'es': 'Mis compras'},
    kFAQ: {'en-US': 'FAQ', 'es': 'Preguntas frecuentes'},
    kComplaintsBook: {
      'en-US': 'Complaints book',
      'es': 'Libro de reclamaciones',
    },
    kCloseSession: {'en-US': 'Logout', 'es': 'Cerrar sesión'},
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
