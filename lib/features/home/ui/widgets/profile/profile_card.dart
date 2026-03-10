import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  const ProfileCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.125),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(label, style: AppTextStyles.font14DartBlueRegular),
    );
  }
}
