import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_repo_test_case/ui/components/theme.dart';

void showErrorToast(BuildContext context, String msg) {
  Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: AppTheme.of(context).redColor,
            textColor: AppTheme.of(context).whiteColor,
            fontSize: 14.0);
}