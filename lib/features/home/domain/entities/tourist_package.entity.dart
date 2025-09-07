/// Is a class that represents the tourist package entity
class TouristPackageEntity {
  /// Tourist package entity
  TouristPackageEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isAvailable,
    required this.isPurchased,
  });

  /// Property id
  final String id;

  /// Property title
  final String title;

  /// Property description
  final String description;

  /// Property price
  final double price;

  /// Property image
  final String image;

  /// Property is available
  final bool isAvailable;

  /// Property is purchased
  final bool isPurchased;
}
