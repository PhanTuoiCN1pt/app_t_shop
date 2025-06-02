import 'package:app_t_shop/features/shop/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_t_shop/features/shop/models/order_model.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/enums.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // Kiểm tra trạng thái đơn hàng để hiển thị nút
    final bool canCancel = order.status == OrderStatus.pending || order.status == OrderStatus.processing;
    final bool canReview = order.status == OrderStatus.delivered;
    final controller = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Trạng thái đơn hàng
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  order.orderStatusText,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: order.statusColor),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Mã đơn hàng và ngày đặt
            Row(
              children: [
                const Icon(Iconsax.tag),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(
                    'Mã đơn: ${order.id}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Iconsax.calendar),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(
                    'Ngày đặt: ${order.formatterOrderDate}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            if (order.deliveryDate != null) ...[
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Iconsax.box),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: Text(
                      order.status == OrderStatus.delivered
                          ? 'Giao hàng thành công: ${order.formatterEstimatedDeliveryDate}'
                          : 'Dự kiến giao hàng: ${order.formatterEstimatedDeliveryDate}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],

            const Divider(height: TSizes.spaceBtwSections),

            /// Phương thức thanh toán và tổng tiền
            Text(
              'Phương thức thanh toán: ${order.paymentMethod}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(
              'Tổng đơn: ${order.totalAmount.toStringAsFixed(0)} ₫',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const Divider(height: TSizes.spaceBtwSections),

            /// Danh sách sản phẩm
            Text(
              'Sản phẩm:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Expanded(
              child: ListView.separated(
                itemCount: order.items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final item = order.items[index];
                  return ListTile(
                    leading: item.image != null
                        ? Image.network(
                      item.image!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image),
                    )
                        : const Icon(Icons.image_not_supported),
                    title: Text(item.title,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Số lượng: ${item.quantity}',
                            style: Theme.of(context).textTheme.bodySmall),
                        if (item.selectedVariation != null &&
                            item.selectedVariation!.isNotEmpty)
                          Text(
                            item.selectedVariation!.entries
                                .map((e) => '${e.key}: ${e.value}')
                                .join(', '),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        if (item.brandName != null)
                          Text('Thương hiệu: ${item.brandName!}',
                              style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    trailing: Text(
                      '${item.price.toStringAsFixed(0)} ₫',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Nút Hủy đơn
            if (canCancel)
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Iconsax.close_circle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Xác nhận hủy đơn hàng'),
                        content: const Text(
                            'Bạn có chắc muốn hủy đơn hàng này không?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('Không'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              controller.cancelOrder(order.id);
                              Navigator.of(context).pop(); // quay lại
                            },
                            child: const Text('Hủy đơn'),
                          ),
                        ],
                      ),
                    );
                  },
                  label: const Text('Hủy đơn hàng'),
                ),
              ),

            /// Nút Đánh giá
            if (canReview)
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Iconsax.star),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  ),
                  onPressed: () {
                    // TODO: Navigate đến màn hình đánh giá
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đi đến đánh giá sản phẩm.')),
                    );
                  },
                  label: const Text('Đánh giá sản phẩm'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
