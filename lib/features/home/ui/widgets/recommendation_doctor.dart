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
        widget.doctors.isEmpty
            ? Center(
                child: Text(
                  'Tab a Speciality from above to preview doctors.',
                  style: AppTextStyles.font14GrayReqular,
                  textAlign: .center,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: seeAll
                    ? widget.doctors.length
                    : (widget.doctors.length > 3 ? 3 : widget.doctors.length),
                itemBuilder: (context, i) => widget.doctors[i],
                separatorBuilder: (context, i) => verticalSpace(12),
              ),
      ],
    );
  }
}
