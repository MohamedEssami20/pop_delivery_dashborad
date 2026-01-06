import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final int code;
  final int discount;
  final String category;
  final String productType;
  final num avrageRating;
  final bool isFavourite;
  final String baseImageUrl;
  final List<dynamic> productImageUrls;
  final num calories;
  final Timestamp createdAt;

  ProductEntity({
    required this.id,
    required this.code,
    required this.category,
    required this.discount,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    required this.isFavourite,
    required this.calories,
    required this.createdAt,
    required this.baseImageUrl,
    required this.productImageUrls,
  });

  // create copy with function
  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? price,
    int? code,
    int? discount,
    String? category,
    String? productType,
    num? avrageRating,
    bool? isFavourite,
    File? imageFile,
    List<File?>? productImages,
    String? baseImageUrl,
    List<String>? productImageUrls,
    num? calories,
    Timestamp? createdAt,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      description: description ?? this.description,
      price: price ?? this.price,
      productType: productType ?? this.productType,
      avrageRating: avrageRating ?? this.avrageRating,
      isFavourite: isFavourite ?? this.isFavourite,
      baseImageUrl: baseImageUrl ?? this.baseImageUrl,
      productImageUrls: productImageUrls ?? this.productImageUrls,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
