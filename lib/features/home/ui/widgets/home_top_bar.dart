import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/container_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is UserLoading ||
                  current is UserSuccess ||
                  current is UserError,
              builder: (context, state) {
                String userName = 'Chief';
                return state.maybeWhen(
                  userLoading: setUpLoading,
                  userSuccess: (userResponse) {
                    userName = userResponse.userData[0].name;
                    return Text(
                      'Hi, $userName!',
                      style: AppTextStyles.font18DarkBlueBold,
                    );
                  },

                  userError: (error) {
                    return shrinkedBox();
                  },
                  orElse: shrinkedBox,
                );
              },
            ),
            Text('How are you Today?', style: AppTextStyles.font11GrayReqular),
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
  }

  Widget setUpLoading() {
    return const ContainerShimmerLoading(
      width: 110,
      height: 14,
      borderRadius: 16,
    );
  }

  Widget shrinkedBox() {
    return const SizedBox.shrink();
  }
}
