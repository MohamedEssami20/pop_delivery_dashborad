import 'dart:io';

class ProductInputEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final int code;
  final String category;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final File? imageFile;
  final List<File?>? productImages;
  final String? baseImageUrl;
  final List<String>? productImageUrls;
  final num calories;
  final DateTime? createdAt;

  ProductInputEntity({
    this.productImages,
    required this.id,
    required this.code,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    this.imageFile,
    this.isFavourite = false,
    required this.calories,
    this.createdAt,
    this.baseImageUrl,
    this.productImageUrls,
  });

  // create copy with function
  ProductInputEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? price,
    int? code,
    String? productType,
    num? avrageRating,
    bool? isFavourite,
    File? imageFile,
    List<File?>? productImages,
    String? baseImageUrl,
    List<String>? productImageUrls,
    num? calories,
    DateTime? createdAt,
  }) {
    return ProductInputEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      category: category,
      description: description ?? this.description,
      price: price ?? this.price,
      productType: productType ?? this.productType,
      avrageRating: avrageRating ?? this.avrageRating,
      isFavourite: isFavourite ?? this.isFavourite,
      imageFile: imageFile ?? this.imageFile,
      productImages: productImages ?? this.productImages,
      baseImageUrl: baseImageUrl ?? this.baseImageUrl,
      productImageUrls: productImageUrls ?? this.productImageUrls,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
