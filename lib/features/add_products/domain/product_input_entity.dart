import 'dart:io';

class ProductInputEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final File? imageFile;
  final List<File>? productImages;
  final String calories;
  final DateTime? createdAt;

  ProductInputEntity(
    this.productImages, {
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    this.imageFile,
    this.isFavourite = false,
    required this.calories,
    this.createdAt,
  });
}
