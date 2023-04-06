import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/constants/app_font_sizes.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnBoardingPage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 3.h),
        Text(
          title,
          style: TextStyle(fontSize: AppFontSize.x_x_large, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2.h),
        Text(
          subtitle,
          style: TextStyle(fontSize: AppFontSize.medium),
        ),
      ],
    );
  }
}
