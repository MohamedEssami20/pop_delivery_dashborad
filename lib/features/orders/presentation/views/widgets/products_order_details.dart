import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/cart_item_entity.dart';

class ProductsOrderDetails extends StatelessWidget {
  final CartItemEntity item;
  const ProductsOrderDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final product = item.productEntity;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.baseImageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: theme.textStyles.bodyMedium,
              ),
              Text(
                "${product.price} \$  •  x${item.quantity}",
                style: theme.textStyles.labelMedium?.copyWith(
                  color: theme.colors.typography300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
