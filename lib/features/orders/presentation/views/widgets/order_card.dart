import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/views/widgets/products_order_details.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/order_entity.dart';
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
            OrderIDAndState(order: order, theme: theme),
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Change Status"),
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
