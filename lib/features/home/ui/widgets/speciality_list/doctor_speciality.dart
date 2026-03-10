import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/ui/widgets/speciality_list/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/cubit/home_cubit.dart';

class DoctorSpeciality extends StatefulWidget {
  final List<SpecializationData> items;
  const DoctorSpeciality({super.key, required this.items});

  @override
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  int currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Doctor Speciality', style: AppTextStyles.font18DarkBlueSemitBold),
        verticalSpace(16),
        widget.items.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.items.length,

                  itemBuilder: (context, i) {
                    final specialization = widget.items[i];
                    return SpecialityItem(
                      label: specialization.speciality,
                      iconPath: 'assets/images/speciality_items/general.png',
                      isSelected: currentSelectedIndex == i,
                      onTap: () => _onSpecialityTap(context, i),
                    );
                  },
                ),
              ),
      ],
    );
  }

  void _onSpecialityTap(BuildContext context, int index) {
    context.read<HomeCubit>().getDoctorsDataById(index + 1);
    setState(() {
      currentSelectedIndex = index;
    });
  }
}
