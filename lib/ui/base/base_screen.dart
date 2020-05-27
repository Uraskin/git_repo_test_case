import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/domain/navigation_store.dart';
import 'package:git_repo_test_case/l10n/l10n.dart';
import 'package:git_repo_test_case/ui/components/theme.dart';
import 'package:git_repo_test_case/utils/disposable.dart';
import 'package:mobx/mobx.dart';
import 'package:git_repo_test_case/ext/ext.dart';


abstract class BaseScreenArgs {

}

abstract class BaseScreen extends StatefulWidget {

}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {

  AppThemeData get theme => AppTheme.of(context);
  Strings get str => Strings.of(context);

  NavigationStore navigationStore;

  final List<ChangeNotifier> _changeNotifiers = [];
  final List<Disposable> _disposables = [];
  final List<ReactionDisposer> _reactionDisposers = [];


  @override
  void initState() {
    super.initState();
    navigationStore = context.inject<NavigationStore>();
    inject();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void inject() {

  }

  T addDisposableReaction<T extends ReactionDisposer>(T reactionDisposer) {
    _reactionDisposers.add(reactionDisposer);
    return reactionDisposer;
  }

  T addDisposableChangeNofifier<T extends ChangeNotifier>(T notifier) {
    _changeNotifiers.add(notifier);
    return notifier;
  }

  T addDisposable<T extends Disposable>(T disposable) {
    _disposables.add(disposable);
    return disposable;
  }

  @override
  void dispose() {
    for(var notifier in _changeNotifiers) {
      notifier.dispose();
    }
    for(var disposable in _disposables) {
      disposable.dispose();
    }
    for(var reactionDisposer in _reactionDisposers) {
      reactionDisposer();
    }
    super.dispose();
  }
  
}

