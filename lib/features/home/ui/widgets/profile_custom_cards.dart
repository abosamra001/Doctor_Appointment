import 'package:advanced2/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'profile_card.dart';

class ProfileCustomCards extends StatelessWidget {
  const ProfileCustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          ProfileCard(
            icon: Icons.person_pin_outlined,
            iconColor: ColorManager.mainBlue,
            label: 'Personal Information',
          ),
          Divider(thickness: 0.5, color: ColorManager.lightGray),
          ProfileCard(
            icon: Icons.receipt_long_outlined,
            iconColor: ColorManager.green,
            label: 'My Test & Diagnostic',
          ),
          Divider(thickness: 0.5, color: ColorManager.lightGray),
          ProfileCard(
            icon: Icons.payment_rounded,
            iconColor: ColorManager.red,
            label: 'Payment',
          ),
        ],
      ),
    );
  }
}
