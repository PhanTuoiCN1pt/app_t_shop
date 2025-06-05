import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';

import '../../controllers/product/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ProductModel product;

  const ChatScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final chatController = ChatController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liên hệ với Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thông tin sản phẩm
            Row(
              children: [
                Image.network(product.thumbnail, width: 60, height: 60, fit: BoxFit.cover),
                const SizedBox(width: 10),
                Expanded(child: Text(product.title, style: Theme.of(context).textTheme.titleMedium)),
              ],
            ),
            const SizedBox(height: 20),

            /// Input chat
            TextField(
              controller: messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập tin nhắn của bạn cho admin...',
              ),
            ),
            const SizedBox(height: 10),

            /// Gửi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final message = messageController.text.trim();
                  if (message.isNotEmpty) {
                    await chatController.sendProductMessage(
                      product: product,
                      message: message,
                    );
                    Get.back(); // Trở lại sau khi gửi
                  } else {
                    Get.snackbar('Lỗi', 'Vui lòng nhập nội dung');
                  }
                },
                child: const Text('Gửi tin nhắn'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
