import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFindNearbyBanner extends StatelessWidget {
  const HomeFindNearbyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      child: Container(
        height: 167.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
        child: Stack(
          alignment: .bottomCenter,
          children: [
            Image.asset('assets/images/find_nearby_banner_background.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Book and \nschedule with \nnearest doctor',
                        style: AppTextStyles.font18WhiteMedium,
                      ),
                      verticalSpace(12),
                      AppTextButton(
                        text: 'Find Nearby',
                        textStyle: AppTextStyles.font12BlueReqular,
                        onPressed: () {},
                        buttonWidth: 109,
                        buttonHeight: 38,
                        backgroundColor: Colors.white,
                        borderRadius: 48,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 10.h,
                        ),
                      ),
                      verticalSpace(18),
                    ],
                  ),
                  Image.asset('assets/images/find_nearby_banner.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
