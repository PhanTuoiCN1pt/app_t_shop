
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key,
    required this.icon,
    this.trailing,
    required this.title,
    required this.subtitle,
    this.onTap
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback?  onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28,color: TColors.black.withOpacity(0.5),),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}