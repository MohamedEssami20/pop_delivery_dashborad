

import 'package:popo_delivery_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../domain/entities/cart_item_entity.dart';
import 'cart_product_model.dart';

class OrderModel {
  final int id;
  final String name;
  final String email;
  final String country;
  final String city;
  final String street;
  final num totalPrice;
  final int apartmentNumber;
  final int houseNumber;
  final int phoneNumber;
  final DateTime dateTime;
  final List<CartItemEntity> cartItemEntityList;
  final String orderState;
  OrderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.city,
    required this.street,
    required this.apartmentNumber,
    required this.houseNumber,
    required this.phoneNumber,
    required this.dateTime,
    required this.cartItemEntityList,
    required this.totalPrice,
    required this.orderState,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'country': country,
      'city': city,
      'street': street,
      'apartmentNumber': apartmentNumber,
      'houseNumber': houseNumber,
      'phoneNumber': phoneNumber,
      'dateTime': dateTime.toIso8601String(),
      'totalPrice': totalPrice,
      'orderState': orderState.toString(),
      'products': cartItemEntityList.map((x) {
        return CartProductModel.fromCartItemEnity(x).toMap();
      }).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      totalPrice: map['totalPrice'] ?? 0,
      street: map['street'] ?? '',
      apartmentNumber: map['apartmentNumber']?.toInt() ?? 0,
      houseNumber: map['houseNumber']?.toInt() ?? 0,
      phoneNumber: map['phoneNumber']?.toInt() ?? 0,
      dateTime: DateTime.parse(map['dateTime'] ?? ''),
      orderState: map['orderState'] ?? '',
      cartItemEntityList: List<CartItemEntity>.from(
        map['products']?.map((x) => CartProductModel.fromJson(x)),
      ),
    );
  }

  OrderEntity toEntity() => OrderEntity(
    id: id,
    name: name,
    email: email,
    country: country,
    orderState: orderState,
    city: city,
    street: street,
    apartmentNumber: apartmentNumber,
    houseNumber: houseNumber,
    phoneNumber: phoneNumber,
    dateTime: dateTime,
    cartItemEntityList: cartItemEntityList,
    totalPrice: totalPrice,
  );

  factory OrderModel.fromEntity(
    OrderEntity entity,
  ) => OrderModel(
    id: entity.id,
    name: entity.name,
    email: entity.email,
    orderState: entity.orderState,
    country: entity.country,
    city: entity.city,
    street: entity.street,
    apartmentNumber: entity.apartmentNumber,
    houseNumber: entity.houseNumber,
    phoneNumber: entity.phoneNumber,
    dateTime: entity.dateTime,
    cartItemEntityList: entity.cartItemEntityList,
    totalPrice: entity.totalPrice,
  );
}
