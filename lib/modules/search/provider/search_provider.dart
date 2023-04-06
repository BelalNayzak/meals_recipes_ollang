import 'package:flutter/cupertino.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/ui_utils/ui_utils.dart';
import '../requests/search_requests.dart';

class SearchProvider with ChangeNotifier {
  bool loading = false;
  List searchedMeals = [];

  final SearchMealsRequest searchMealsRequest;

  SearchProvider(this.searchMealsRequest);

  Future<void> searchMeals(BuildContext context, String keyword,
      {Map? filters}) async {
    loading = true;
    notifyListeners();

    try {
      searchedMeals = await searchMealsRequest.call(keyword, filters: filters);
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

  getSearchHistory(BuildContext context) {}
}
