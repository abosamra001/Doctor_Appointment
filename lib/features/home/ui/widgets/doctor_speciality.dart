import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/ui/widgets/speciality_item.dart';
import 'package:flutter/material.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Doctor Speciality',
              style: AppTextStyles.font18DarkBlueSemitBold,
            ),
            GestureDetector(
              onTap: () {},
              child: Text('See All', style: AppTextStyles.font12BlueReqular),
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            SpecialityItem(
              onTap: () {},
              label: 'General',
              iconPath: 'assets/images/speciality_items/Man_Doctor.png',
            ),
            SpecialityItem(
              onTap: () {},
              label: 'Neurologic',
              iconPath: 'assets/images/speciality_items/Brain.png',
            ),
            SpecialityItem(
              onTap: () {},
              label: 'Pediatric',
              iconPath: 'assets/images/speciality_items/baby.png',
            ),
            SpecialityItem(
              onTap: () {},
              label: 'Radiology',
              iconPath: 'assets/images/speciality_items/Kidneys.png',
            ),
          ],
        ),
      ],
    );
  }
}
