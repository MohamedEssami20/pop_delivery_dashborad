import 'cart_item_entity.dart';

class OrderEntity {
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

  OrderEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.city,
    required this.street,
    required this.totalPrice,
    required this.apartmentNumber,
    required this.houseNumber,
    required this.phoneNumber,
    required this.dateTime,
    required this.cartItemEntityList,
    required this.orderState,
  });
}
