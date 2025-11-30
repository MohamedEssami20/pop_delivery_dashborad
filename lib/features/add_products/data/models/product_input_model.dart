class ProductInputModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final String imageFile;
  final List<String> productImages;
  final String calories;
  final DateTime? createdAt;

  ProductInputModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    this.isFavourite =false,
    required this.imageFile,
    required this.productImages,
    required this.calories,
    required this.createdAt,
  });
}
