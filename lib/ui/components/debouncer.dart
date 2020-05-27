import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/utils/disposable.dart';

class Debouncer implements Disposable {
  final Duration duration;
  VoidCallback action;
  Timer _timer;

  Debouncer(
      {this.duration = const Duration(
        milliseconds: 500,
      )});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(duration, action);
  }

  @override
  dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
