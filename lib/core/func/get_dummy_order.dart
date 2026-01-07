import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popo_delivery_dashboard/core/entities/product_entity.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../features/orders/domain/entities/cart_item_entity.dart';

OrderEntity getDummyOrder() {
  return OrderEntity(
    id: 12351,
    name: 'John Doe',
    email: 'eYHt8@example.com',
    country: 'United States',
    orderState: 'OrderState.preparing',
    city: 'New York',
    street: '123 Main St',
    apartmentNumber: 50,
    houseNumber: 123,
    phoneNumber: 0124154112,
    dateTime: DateTime.now(),
    cartItemEntityList: getDummyCartItems(),
    totalPrice: 50.50,
  );
}

List<CartItemEntity> getDummyCartItems() => [
  CartItemEntity(productEntity: getDummyProduct(), quantity: 1),
  CartItemEntity(productEntity: getDummyProduct(), quantity: 2),
  CartItemEntity(productEntity: getDummyProduct(), quantity: 2),
  CartItemEntity(productEntity: getDummyProduct(), quantity: 3),
];

ProductEntity getDummyProduct() => ProductEntity(
  id: "12351",
  name: 'John Doe',
  avrageRating: 2.2,
  calories: 2.2,
  category: 'John Doe',
  code: 12351,
  description: 'John Doe',
  discount: 10,
  baseImageUrl:
      'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
  isFavourite: true,
  price: "50",
  productImageUrls: [
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
  ],
  productType: 'John Doe',
  createdAt: Timestamp.now(),
);
