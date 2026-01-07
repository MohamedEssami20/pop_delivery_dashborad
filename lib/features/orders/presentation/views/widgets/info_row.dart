import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppThemeHelper(context).textStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
