import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is UserLoading ||
          current is UserSuccess ||
          current is UserError,
      builder: (context, state) {
        String userName = 'Chief';
        state.whenOrNull(
          userSuccess: (data) {
            userName = data.userData[0].name;
          },
        );
        return Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Hi, $userName!', style: AppTextStyles.font18DarkBlueBold),
                Text(
                  'How are you Today?',
                  style: AppTextStyles.font11GrayReqular,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: ColorManager.whiteSmoke,
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 24.w,
                  color: ColorManager.darkBlue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
