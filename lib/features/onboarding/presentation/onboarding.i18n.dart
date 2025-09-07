import 'package:i18n_extension/i18n_extension.dart';

/// ===Onboarding===
/// Constante: Marca
const kBrand = 'kBrand';

/// Constante: title 1 onBoard
const kTitle1 = 'kTitle1';

/// Constante: description 1
const kDescription1 = 'kDescription1';

/// Constante: title 2 onBoard
const kTitle2 = 'kTtitle2';

/// Constante:  description 2
const kDescription2 = 'kDescription2';

/// Constante: title 3 onBoard
const kTitle3 = 'kTtitle3';

/// Constante:  description 3
const kDescription3 = 'kDescription3';

/// Constante: title 4 onBoard
const kTitle4 = 'kTtitle4';

/// Constante:  description 4
const kDescription4 = 'kDescription4';

/// Cadenas de traduccion
extension OnBoardingStrings on String {
  static final _t = Translations.byId('en-US', {
    /// Onboarding
    kBrand: {'en-US': 'Pringstom', 'es': 'Pringstom'},
    kTitle1: {'en-US': 'Discover Peru', 'es': 'Descubre el Perú'},
    kDescription1: {
      'en-US':
          'Explore the Amazon rainforest, the Andes mountains, and the Pacific'
          ' coast.',
      'es':
          'Explora la selva amazónica, la sierra de los Andes y las costas del'
          ' pacífico',
    },
    kTitle2: {'en-US': 'Your complete guide', 'es': 'Tu guía completa'},
    kDescription2: {
      'en-US':
          'Itineraries designed for solo travelers, friends, or on the '
          'road.',
      'es':
          'Itinerarios hechos para disfrutar solo, con amigos o sobre '
          'ruedas.',
    },
    kTitle3: {'en-US': 'Gastronomic routes', 'es': 'Rutas gastronómicas'},
    kDescription3: {
      'en-US': 'Enjoy an unforgettable culinary experience.',
      'es': 'Disfruta de una experiencia culinaria inolvidable.',
    },
    kTitle4: {'en-US': 'Dances and festivities', 'es': 'Danzas y festividades'},
    kDescription4: {
      'en-US':
          'Discover the cultural richness through its dances and'
          ' festivities.',
      'es':
          'Descubre la riqueza cultural a través de sus danzas y'
          ' festividades',
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
