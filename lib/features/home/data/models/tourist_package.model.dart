import 'package:way24/core/presentation/utils/get_languaje.util.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';

/// Is a class that represents the tourist package model
class TouristPackageModel extends TouristPackageEntity {
  /// Tourist package model
  TouristPackageModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.image,
    required super.isAvailable,
    required super.isPurchased,
  });

  /// Factory mapper data supabase
  factory TouristPackageModel.fromMap(Map<String, dynamic> map) {
    final languaje = getDeviceLanguage();
    return TouristPackageModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map.containsKey('description_$languaje')
          ? map['description_$languaje'] as String
          : 'description_en', // Valor por defecto si la clave no existe
      price: (map['price'] as num).toDouble(),
      image: map['image'] as String,
      isAvailable: map['is_available'] as bool,
      isPurchased: map['is_purchased'] as bool,
    );
  }
}
