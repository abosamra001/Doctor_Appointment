import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctors/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';

class RecommendationDoctors extends StatefulWidget {
  final List<DoctorsData> doctorsDataList;
  const RecommendationDoctors({super.key, required this.doctorsDataList});

  @override
  State<RecommendationDoctors> createState() => _RecommendationDoctorsState();
}

class _RecommendationDoctorsState extends State<RecommendationDoctors> {
  bool seeAll = false;
  @override
  Widget build(BuildContext context) {
    if (widget.doctorsDataList.isNullOrEmpty()) {
      return Center(
        child: Text(
          'Tab a Speciality from above to preview doctors.',
          style: AppTextStyles.font14GrayReqular,
          textAlign: TextAlign.center,
        ),
      );
    }

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
            itemCount: widget.doctorsDataList.length,
            itemBuilder: (context, i) {
              final doctor = widget.doctorsDataList[i];
              return RecommendationDoctorItem(
                doctorName: doctor.name,
                image: doctor.photo,
                degree: doctor.degree,
                phoneNumber: doctor.phone,
                email: doctor.email,
              );
            },
            separatorBuilder: (context, i) => verticalSpace(12),
          ),
        ),
      ],
    );
  }
}
