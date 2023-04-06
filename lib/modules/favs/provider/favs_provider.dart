import 'package:flutter/cupertino.dart';
import 'package:ollang_recipes/common/errors/exceptions.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/ui_utils/ui_utils.dart';
import '../requests/favs_requests.dart';

class FavsProvider with ChangeNotifier {
  bool loading = false;
  List favs = [];

  final GetFavsRequest getFavsRequest;

  FavsProvider(this.getFavsRequest);

  Future<void> getFavs(BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      favs = await getFavsRequest.call();
    } on EmptyCacheException {
      UiUtils.snackMsg(context,
          txt: 'You have no favourits yet.', bkgColor: AppColors.redColor);
    }

    loading = false;
    notifyListeners();
  }
}
