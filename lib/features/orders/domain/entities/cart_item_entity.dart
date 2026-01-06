
import 'package:equatable/equatable.dart';

import '../../../../core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 1});
  
  @override
  List<Object?> get props => [productEntity, quantity];
}
