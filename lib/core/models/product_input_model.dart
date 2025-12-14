import 'dart:io';

import '../entities/product_input_entity.dart';

class ProductInputModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final int code;
  final int discount;
  final String category;
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
    required this.discount,
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.category,
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
      'code': code,
      'category': category,
      'discount': discount,
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
      code: product.code,
      discount: product.discount,
      category: product.category,
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
