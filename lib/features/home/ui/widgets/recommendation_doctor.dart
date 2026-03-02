import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Recommendation Doctor',
              style: AppTextStyles.font18DarkBlueSemitBold,
            ),
            GestureDetector(
              onTap: () {},
              child: Text('See All', style: AppTextStyles.font12BlueReqular),
            ),
          ],
        ),
        verticalSpace(8),
        const RecommendationDoctorItem(
          doctorName: 'Randy Wigham',
          specialize: 'General  |  RSUD Gatot Subroto',
          imagePath: 'assets/images/doc1.png',
          rating: '4.8',
          reviewCount: '(4,279 reviews)',
        ),
        verticalSpace(8),
        const RecommendationDoctorItem(
          doctorName: 'Jack Sulivan',
          specialize: 'General  |  RSUD Gatot Subroto',
          imagePath: 'assets/images/doc2.png',
          rating: '4.8',
          reviewCount: '(4,279 reviews)',
        ),
      ],
    );
  }
}
