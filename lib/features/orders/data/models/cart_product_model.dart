
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/cart_item_entity.dart';


class CartProductModel {
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
  final int quantity;

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
    required this.quantity,
  });

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
    return CartProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      code: map['code'] ?? 0,
      discount: map['discount'] ?? 0,
      category: map['category'] as String,
      productType: map['productType'] as String,
      avrageRating: map['avrageRating'] as num,
      isFavourite: map['isFavourite'] as bool,
      imageFile: map['imageFile'] as String,
      productImages: map['productImages'] as List<dynamic>,
      calories: map['calories'] as num,
      createdAt: map['createdAt'] as Timestamp,
      quantity: map['quantity'] as int,
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
