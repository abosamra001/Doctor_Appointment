import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/widgets/screen_wrapper.dart';
import 'package:advanced2/features/home/logic/cubit/home_cubit.dart';
import 'package:advanced2/features/home/ui/widgets/name_and_email.dart';
import 'package:advanced2/features/home/ui/widgets/profile_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/home_state.dart';
import '../widgets/my_appointments_and_mediacl_records.dart';
import '../widgets/profile_custom_cards.dart';
import '../widgets/profile_picture.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      overlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.mainBlue,
      ),
      child: Scaffold(
        backgroundColor: ColorManager.mainBlue,
        body: SafeArea(
          child: Column(
            children: [
              const ProfileTopBar(),
              verticalSpace(92),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          BlocBuilder<HomeCubit, HomeState>(
                            buildWhen: (previous, current) =>
                                current is UserSuccess,

                            builder: (context, state) {
                              String name = 'New Memner';
                              String email = '';
                              state.whenOrNull(
                                userSuccess: (data) {
                                  name = data.userData[0].name;
                                  email = data.userData[0].email;
                                },
                              );
                              return NameAndEmail(name: name, email: email);
                            },
                          ),
                          verticalSpace(16),
                          const MyAppointmentsAndMediaclRecords(),
                          const ProfileCustomCards(),
                        ],
                      ),
                    ),
                    const Positioned(top: -60, child: ProfilePicture()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
