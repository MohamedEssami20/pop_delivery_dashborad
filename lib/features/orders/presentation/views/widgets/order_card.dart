import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/views/widgets/products_order_details.dart';
import '../../../../../core/func/next_order_state_color.dart';
import '../../../../../core/func/next_order_statues.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/order_entity.dart';
import '../../manager/change_order_state_cubit/change_order_state_cubit.dart';
import 'info_row.dart';
import 'order_id_and_state.dart';
import 'order_products_images.dart';
import 'order_total_price.dart';

class OrderCard extends StatefulWidget {
  final OrderEntity order;
  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final order = widget.order;
    final isFinished =
        order.orderState == "delivered" || order.orderState == "completed";
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderIDAndState(order: widget.order, theme: theme),
            const SizedBox(height: 8),
            Text(
              "Placed on ${order.dateTime}",
              style: theme.textStyles.bodySmall?.copyWith(
                color: theme.colors.typography300,
              ),
            ),
            const Divider(height: 32),
            InfoRow(icon: Icons.person, text: order.name),
            InfoRow(icon: Icons.phone, text: order.phoneNumber.toString()),
            InfoRow(
              icon: Icons.location_on,
              text:
                  "${order.country}, ${order.city}, ${order.street} - House ${order.houseNumber}",
            ),
            const SizedBox(height: 12),
            OrdersPtoductsImages(order: order),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Visibility(
                visible: isExpanded,
                child: Column(
                  children: [
                    const Divider(height: 32),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order.cartItemEntityList.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = order.cartItemEntityList[index];
                        return ProductsOrderDetails(item: item);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 32),
            OrderTotalPrice(theme: theme, order: order),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() => isExpanded = !isExpanded);
                    },
                    child: Text(isExpanded ? "Hide Details" : "View Details"),
                  ),
                ),
                const SizedBox(width: 8),

                if (!isFinished)
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: nextOrderStateColor(order.orderState),
                      ),
                      onPressed: () {
                        context.read<ChangeOrderStateCubit>().changeOrderState(
                          orderState: nextOrderState(order.orderState),
                          orderId: order.id,
                          userId: order.userId,
                        );
                      },
                      child: Text(
                        "Move to ${nextOrderState(order.orderState)}",
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ElevatedButton(
                      onPressed: null,
                      child: const Text("Delivered"),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
