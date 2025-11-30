import 'dart:io';

import '../../domain/entities/product_input_entity.dart';

class ProductInputModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final File? image;
  final List<File?>? productImagesFile;
  final String imageFile;
  final List<String> productImages;
  final num calories;
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
    this.image,
    this.productImagesFile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'productType': productType,
      'avrageRating': avrageRating,
      'isFavourite': isFavourite,
      'imageFile': imageFile,
      'productImages': productImages,
      'calories': calories,
      'createdAt': createdAt,
    };
  }

  factory ProductInputModel.fromProductEntity(ProductInputEntity product) {
    return ProductInputModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      productType: product.productType,
      avrageRating: product.avrageRating,
      isFavourite: product.isFavourite,
      imageFile: product.baseImageUrl?? 'No Image',
      productImages: product.productImageUrls?? [],
      calories: product.calories,
      createdAt: product.createdAt,
      image: product.imageFile,
      productImagesFile: product.productImages,
    );
  }
}
