import 'package:flutter/material.dart';

import '../../../../../core/func/order_state_color.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/order_entity.dart';

class OrderIDAndState extends StatelessWidget {
  const OrderIDAndState({super.key, required this.order, required this.theme});

  final OrderEntity order;
  final AppThemeHelper theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Order #${order.id}", style: theme.textStyles.titleMedium),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: orderStateColor(order.orderState),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            order.orderState.toUpperCase().substring(11),
            style: theme.textStyles.labelMedium?.copyWith(
              color: orderStateTextColor(order.orderState),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
