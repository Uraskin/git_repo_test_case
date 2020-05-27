import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/ui/base/base_screen.dart';
import 'package:git_repo_test_case/utils/disposable.dart';
import 'package:mobx/mobx.dart';

extension ChangeNotifierDisposeWithStateExtension<T extends ChangeNotifier> on T {
  T disposeWith(BaseScreenState screen) {
    return screen.addDisposableChangeNofifier(this);
  }
}

extension DisposableDisposeWithStateExtension<T extends Disposable> on T {
  T disposeWith(BaseScreenState screen) {
    return screen.addDisposable(this);
  }
}

extension ReactionDisposeWithStateExtension on ReactionDisposer {
  ReactionDisposer disposeWith(BaseScreenState screen) {
    return screen.addDisposableReaction(this);
  }
}