/// model for tourist site data
class TouristSite {
  /// model for tourist site data
  TouristSite({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isAvailable,
  });

  /// id of the tourist site
  final String id;

  /// title of the tourist site
  final String title;

  /// description of the tourist site
  final String description;

  /// price of the tourist site
  final double price;

  /// image of the tourist site
  final String image;

  /// is available of the tourist site
  final bool isAvailable;
}
