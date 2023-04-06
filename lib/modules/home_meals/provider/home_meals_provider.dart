import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/constants/app_colors.dart';
import 'package:ollang_recipes/common/errors/exceptions.dart';

import '../../../common/ui_utils/ui_utils.dart';
import '../../home_meals/requests/get_home_meals_request.dart';

class HomeMealsProvider with ChangeNotifier {
  bool loading = false;
  List meals = [];

  final GetHomeMealsRequest getHomeMealsRequest;

  HomeMealsProvider(this.getHomeMealsRequest);

  Future<void> getHomeMeals(BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      meals = await getHomeMealsRequest.call();
    } on ServerException {
      UiUtils.snackMsg(context,
          txt: 'Oops! Server-side error.', bkgColor: AppColors.redColor);
    } on NoInternetException {
      UiUtils.snackMsg(context,
          txt: 'Oops! No internet connection.', bkgColor: AppColors.redColor);
    }

    loading = false;
    notifyListeners();
  }
}
