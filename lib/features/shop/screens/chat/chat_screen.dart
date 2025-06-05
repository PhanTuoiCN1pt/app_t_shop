import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product/chat_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';

class ChatScreen extends StatelessWidget {
  final ProductModel product;

  ChatScreen({super.key, required this.product});

  final TextEditingController messageController = TextEditingController();
  final chatController = ChatController.instance;

  @override
  Widget build(BuildContext context) {
    chatController.loadMessages(product.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            chatController.reset();
            Get.back();
          },
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                product.thumbnail,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                product.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          /// Danh sách tin nhắn (giả lập để hiển thị)
          Expanded(
            child: Obx(() {
              final messages = chatController.messages; // List<MessageModel>
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isUser = msg.isUser;

                  return Align(
                    alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      constraints:
                      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: isUser
                            ? Colors.blueAccent
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        msg.text,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          /// Input ở dưới cùng
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                /// TextField
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Nhập tin nhắn...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                /// Gửi
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    final text = messageController.text.trim();
                    if (text.isNotEmpty) {
                      await chatController.sendProductMessage(
                        product: product,
                        message: text,
                      );
                      messageController.clear();
                    } else {
                      Get.snackbar('Lỗi', 'Vui lòng nhập nội dung');
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
