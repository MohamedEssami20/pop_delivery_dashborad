import 'package:flutter/material.dart';

import '../../../domain/entities/order_entity.dart';
import 'order_product_item.dart';

class OrdersPtoductsImages extends StatelessWidget {
  const OrdersPtoductsImages({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: order.cartItemEntityList.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return OrderProductItem(
            cartItemEntity: order.cartItemEntityList[index],
          );
        },
      ),
    );
  }
}