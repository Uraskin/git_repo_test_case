import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/main.dart';
import 'package:git_repo_test_case/ui/screens/repository_details/repository_details_store.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore extends _NavigationStoreBase with _$NavigationStore {
  static const splash = '/';
  static const main = 'main';
  static const repoDetails = 'repoDetails';
  static const newRepo = 'newRepo';
}

abstract class _NavigationStoreBase with Store {
  NavigatorState get _rootNavigator => MyApp.navigatorKey.currentState;

  void popRootNavigator() {
    _rootNavigator.pop();
  }

  @action
  void navigateAppRoot() {
    _rootNavigator.pushNamedAndRemoveUntil(NavigationStore.main, (route) => false);
  }

  @action
  void navigateRepositoryDetails(RepositoryDetailsArguments args) {
    _rootNavigator.pushNamed(NavigationStore.repoDetails, arguments: args);
  }

  @action
  void navigateNewRepo() {
    _rootNavigator.pushNamed(NavigationStore.newRepo);
  }
}