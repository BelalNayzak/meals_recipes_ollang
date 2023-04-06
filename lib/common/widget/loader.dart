import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/constants/app_images.dart';
import 'package:sizer/sizer.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 7.h,
        width: 7.h,
        child: Image.asset(AppImages.loading2),
      ),
    );
  }
}
