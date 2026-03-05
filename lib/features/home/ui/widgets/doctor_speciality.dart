import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/ui/widgets/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
  final List<SpecializationData> items;
  final Function(int) onSpecialityTap;
  final int? selectedItem;
  const DoctorSpeciality({
    super.key,
    required this.items,
    required this.onSpecialityTap,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Doctor Speciality', style: AppTextStyles.font18DarkBlueSemitBold),
        verticalSpace(16),
        items.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,

                  itemBuilder: (context, i) {
                    final specialization = items[i];
                    return SpecialityItem(
                      label: specialization.speciality,
                      iconPath: 'assets/images/speciality_items/general.png',
                      isSelected: selectedItem == i,
                      onTap: () => onSpecialityTap(i),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
