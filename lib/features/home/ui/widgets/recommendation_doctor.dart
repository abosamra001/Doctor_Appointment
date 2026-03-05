import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';

class RecommendationDoctors extends StatefulWidget {
  final List<RecommendationDoctorItem> doctors;
  const RecommendationDoctors({super.key, required this.doctors});

  @override
  State<RecommendationDoctors> createState() => _RecommendationDoctorsState();
}

class _RecommendationDoctorsState extends State<RecommendationDoctors> {
  bool seeAll = false;
  @override
  Widget build(BuildContext context) {
    if (widget.doctors.isEmpty) {
      return Center(
        child: Text(
          'Tab a Speciality from above to preview doctors.',
          style: AppTextStyles.font14GrayReqular,
          textAlign: TextAlign.center,
        ),
      );
    }
    final visibleDoctorsList = seeAll
        ? widget.doctors
        : widget.doctors.take(3).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Recommendation Doctors',
              style: AppTextStyles.font18DarkBlueSemitBold,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  seeAll = !seeAll;
                });
              },
              child: Text(
                seeAll ? 'See less' : 'See all',
                style: AppTextStyles.font12BlueReqular,
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Expanded(
          child: ListView.separated(
            itemCount: visibleDoctorsList.length,
            itemBuilder: (context, i) => visibleDoctorsList[i],
            separatorBuilder: (context, i) => verticalSpace(12),
          ),
        ),
      ],
    );
  }
}
