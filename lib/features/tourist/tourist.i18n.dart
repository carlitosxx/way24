import 'package:i18n_extension/i18n_extension.dart';

/// ===Tourist===
/// Constante: My purchases
const kLocation = 'kLocation';

/// Constante: Protector solar
const kSunScreen = 'kSunScreen';

/// Constante: Repelente
const kRepellent = 'kRepellent';

/// Constante: PetFriendly
const kPetFriendly = 'kPetFriendly';

/// Constante: Estacionamiento
const kHasParking = 'kHasParking';

/// Contanste: Accesibilidad
const kAccesibility = 'kAccesibility';

/// Constante: Sombrilla
const kUmbrella = 'kUmbrella';

/// Constante: Informacion extra
const kExtraInformation = 'kExtraInformation';

/// Constante: Viajas con tu vehiculo?
const kTravelWithYourVehicle = 'kTravelWithYourVehicle';

/// Constante: Grifos
const kGasStations = 'kGasStations';

/// Constante: Reparador de llantas
const kTireRepairShop = 'kTireRepairShop';

/// Constante: Encuentra los reparadores de llantas en la ruta
const kFindTireRepairShop = 'kFindTireRepairShop';

/// Constante: Encuentra los grifos mas cercanos en la ruta
const kFindGasStations = 'kFindGasStations';

/// Constante: Descripcion
const kDescription = 'kDescription';

/// Constante: Telefonos de responsables
const kResponsiblePhone = 'kResponsiblePhone';

/// Constante: Horario de atencion
const kOpeningHours = 'kOpeningHours';

/// Constante: Horario de mantenimiento
const kMaintenanceSchedule = 'kMaintenanceSchedule';

/// Constante: Escoge un sitio turistico
const kChooseTouristSite = 'kChooseTouristSite';

/// Constante: No cuenta con descripcion
const kNoDescription = 'kNoDescription';

/// Constante: Itinerario
const kItinerary = 'kItinerary';

/// Constante: Lista de sitios turisticos
const kTouristList = 'kTouristList';

/// Constante: No hay datos disponibles
const kDataNotAvailable = 'kDataNotAvailable';

/// Cadenas de traduccion
extension TouristStrings on String {
  static final _t = Translations.byId('en-US', {
    /// Orders
    kLocation: {'en-US': 'Location', 'es': 'Ubicación'},
    kSunScreen: {'en-US': 'Sunscreen', 'es': 'Protector'},
    kRepellent: {'en-US': 'Repellent', 'es': 'Repelente'},
    kPetFriendly: {'en-US': 'Pet friendly', 'es': 'Mascotas'},
    kHasParking: {'en-US': 'Has Parking', 'es': 'Estacionamiento'},
    kAccesibility: {'en-US': 'Accesibility', 'es': 'Accesibilidad'},
    kUmbrella: {'en-US': 'Umbrella', 'es': 'Sombrilla'},
    kExtraInformation: {
      'en-US': 'Extra information',
      'es': 'Informacion extra',
    },
    kTravelWithYourVehicle: {
      'en-US': 'Do you travel with your vehicle?',
      'es': 'Viajas con tu propio auto?',
    },
    kGasStations: {'en-US': 'Gas stations', 'es': 'Grifos'},
    kFindGasStations: {
      'en-US': 'Find the nearest gas stations on the route.',
      'es': 'Encuentra los grifos mas cercanos en la ruta',
    },
    kTireRepairShop: {
      'en-US': 'Tire repair shop',
      'es': 'Reparador de llantas',
    },
    kFindTireRepairShop: {
      'en-US': 'Find the nearest tire repair shops on the route.',
      'es': 'Encuentra a los reparadores de llantas en la ruta',
    },
    kDescription: {'en-US': 'Description', 'es': 'Descripción'},
    kResponsiblePhone: {
      'en-US': 'Responsibles phone',
      'es': 'Celulares de responsables',
    },
    kOpeningHours: {'en-US': 'Opening hours', 'es': 'Horario de atención'},
    kMaintenanceSchedule: {
      'en-US': 'Maintenance schedule',
      'es': 'Horario de mantenimiento',
    },
    kChooseTouristSite: {
      'en-US': 'Choose a tourist site',
      'es': 'Escoge un sitio turístico',
    },
    kNoDescription: {
      'en-US': 'Does not have a description',
      'es': 'No cuenta con descripción',
    },
    kItinerary: {'en-US': 'Itinerary', 'es': 'Itinerario'},
    kTouristList: {'en-US': 'Tourist sites', 'es': 'Sitios turisticos'},
    kDataNotAvailable: {
      'en-US': 'No data available',
      'es': 'No hay datos disponibles',
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
