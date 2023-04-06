import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';

class BlackGreenText extends StatelessWidget {
  final String blackTxt;
  final String greenTxt;

  const BlackGreenText(
      {Key? key, required this.blackTxt, required this.greenTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$blackTxt ',
          style: TextStyle(
            fontSize: AppFontSize.x_small,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          greenTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppFontSize.x_small,
            color: AppColors.greenColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
