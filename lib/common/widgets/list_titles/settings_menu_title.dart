import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    this.iconColor, // Thêm màu cho icon
    this.trailing,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final Color? iconColor; // Thêm biến iconColor
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: iconColor ?? TColors.black.withOpacity(0.5), // Sử dụng iconColor nếu có
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
