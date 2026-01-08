import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/entities/product_entity.dart';
import '../../domain/entities/cart_item_entity.dart';

// ignore: must_be_immutable
class CartProductModel extends CartItemEntity {
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
  final String imageFile;
  final List<dynamic> productImages;
  final num calories;
  final Timestamp createdAt;

  CartProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.discount,
    required this.category,
    required this.productType,
    required this.avrageRating,
    required this.isFavourite,
    required this.imageFile,
    required this.productImages,
    required this.calories,
    required this.createdAt,
    required super.quantity,
  }) : super(
         productEntity: ProductEntity(
           id: id,
           name: name,
           avrageRating: avrageRating,
           isFavourite: isFavourite,
           calories: calories,
           createdAt: createdAt,
           baseImageUrl: imageFile,
           price: price,
           code: code,
           discount: discount,
           category: category,
           productType: productType,
           description: description,
           productImageUrls: productImages,
         ),
       );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'discount': discount,
      'category': category,
      'productType': productType,
      'avrageRating': avrageRating,
      'isFavourite': isFavourite,
      'imageFile': imageFile,
      'productImages': productImages,
      'calories': calories,
      'createdAt': createdAt,
      'quantity': quantity,
    };
  }

  factory CartProductModel.fromJson(Map<String, dynamic> map) {
    final product = ProductEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      code: map['code'] ?? 0,
      discount: map['discount'] ?? 0,
      category: map['category'],
      productType: map['productType'],
      avrageRating: map['avrageRating'],
      isFavourite: map['isFavourite'],
      baseImageUrl: map['imageFile'],
      productImageUrls: List<String>.from(map['productImages']),
      calories: map['calories'],
      createdAt: map['createdAt'],
    );
    return CartProductModel(
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
      imageFile: product.baseImageUrl,
      productImages: product.productImageUrls,
      calories: product.calories,
      createdAt: product.createdAt,
      quantity: map['quantity'],
    );
  }

  factory CartProductModel.fromCartItemEnity(CartItemEntity cartItemEntity) {
    return CartProductModel(
      id: cartItemEntity.productEntity.id,
      name: cartItemEntity.productEntity.name,
      description: cartItemEntity.productEntity.description,
      price: cartItemEntity.productEntity.price,
      code: cartItemEntity.productEntity.code,
      discount: cartItemEntity.productEntity.discount,
      category: cartItemEntity.productEntity.category,
      productType: cartItemEntity.productEntity.productType,
      avrageRating: cartItemEntity.productEntity.avrageRating,
      isFavourite: cartItemEntity.productEntity.isFavourite,
      imageFile: cartItemEntity.productEntity.baseImageUrl,
      productImages: cartItemEntity.productEntity.productImageUrls,
      calories: cartItemEntity.productEntity.calories,
      createdAt: cartItemEntity.productEntity.createdAt,
      quantity: cartItemEntity.quantity,
    );
  }
}
