import 'package:flutter/material.dart';

class UiUtils {
  static void snackMsg(BuildContext ctx,
      {required String txt, required Color bkgColor}) {
    ScaffoldMessenger.of(ctx).removeCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: bkgColor,
        content: Text(txt),
      ),
    );
  }
}
