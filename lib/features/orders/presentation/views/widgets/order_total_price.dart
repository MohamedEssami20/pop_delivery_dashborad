import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/order_entity.dart';

class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({
    super.key,
    required this.theme,
    required this.order,
  });

  final AppThemeHelper theme;
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Total:", style: theme.textStyles.titleMedium),
        const Spacer(),
        Text(
          "${order.totalPrice} \$",
          style: theme.textStyles.titleLarge?.copyWith(
            color: theme.colors.primary500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}