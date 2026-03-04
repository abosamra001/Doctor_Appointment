import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/ui/widgets/speciality_item.dart';
import 'package:flutter/material.dart';

class DoctorSpeciality extends StatefulWidget {
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
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  bool seeAll = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Doctor Speciality',
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
        verticalSpace(16),
        widget.items.isEmpty
            ? const Center(child: Text('Loading Specializations...'))
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: seeAll
                    ? widget.items.length
                    : (widget.items.length > 4 ? 4 : widget.items.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, i) {
                  final specialization = widget.items[i];
                  return SpecialityItem(
                    label: specialization.speciality,
                    iconPath: 'assets/images/speciality_items/general.png',
                    isSelected: widget.selectedItem == i,
                    onTap: () => widget.onSpecialityTap(i),
                  );
                },
              ),
      ],
    );
  }
}
