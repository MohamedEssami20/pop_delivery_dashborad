import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/core/utils/custom_network_image.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/cart_item_entity.dart';

class OrderProductItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;

  const OrderProductItem({super.key, required this.cartItemEntity});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: CustomNetowrkImage(
            imageUrl:  cartItemEntity.productEntity.baseImageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "x${cartItemEntity.quantity}",
          style: AppThemeHelper(context).textStyles.labelMedium,
        ),
      ],
    );
  }
}
