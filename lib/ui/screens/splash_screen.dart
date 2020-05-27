import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_repo_test_case/ui/base/base_screen.dart';
import 'package:git_repo_test_case/ui/components/images.dart';

class SplashScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreenState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      navigationStore.navigateAppRoot();
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        alignment: Alignment.center,
        color: theme.whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(Images.gitLogo),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
