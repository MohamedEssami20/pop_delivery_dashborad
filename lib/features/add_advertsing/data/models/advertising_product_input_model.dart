import 'dart:io';

import 'package:popo_delivery_dashboard/features/add_advertsing/domain/entities/advertising_product_input_entity.dart';
class AdvertisingProductInputModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final num productDiscount;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final File? image;
  final List<File?>? productImagesFile;
  final String imageFile;
  final List<String> productImages;
  final num calories;
  final DateTime? createdAt;

  AdvertisingProductInputModel({
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
    this.productImagesFile, required this.productDiscount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'productDiscount': productDiscount,
      'productType': productType,
      'avrageRating': avrageRating,
      'isFavourite': isFavourite,
      'imageFile': imageFile,
      'productImages': productImages,
      'calories': calories,
      'createdAt': createdAt,
    };
  }

  factory AdvertisingProductInputModel.fromProductEntity(AdvertisingProductInputEntity product) {
    return AdvertisingProductInputModel(
      id: product.id,
      name: product.name,
      description: product.description,
      productDiscount: product.productDiscount,
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
