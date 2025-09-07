import 'package:i18n_extension/i18n_extension.dart';

/// ===Orders===
// / Constante: My purchases
const kMyPurchases = 'kMyPurchases';

/// Cadenas de traduccion
extension OrdersStrings on String {
  static final _t = Translations.byId('en-US', {
    /// Orders
    kMyPurchases: {'en-US': 'My purchases', 'es': 'Mis compras'},
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
