import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:git_repo_test_case/domain/navigation_store.dart';
import 'package:git_repo_test_case/ui/screens/main_screen.dart';
import 'package:git_repo_test_case/ui/screens/new_repository/new_repository_screen.dart';
import 'package:git_repo_test_case/ui/screens/new_repository/new_repository_store.dart';
import 'package:git_repo_test_case/ui/screens/repository_details/repository_details_screen.dart';
import 'package:git_repo_test_case/ui/screens/repository_details/repository_details_store.dart';
import 'package:git_repo_test_case/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:git_repo_test_case/ext/ext.dart';


final RouteFactory onGenerateRoute = (settings) {
  switch(settings.name) {
    case NavigationStore.splash:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
    case NavigationStore.main:
      return MaterialPageRoute(
        builder: (context) => MainScreen(),
      );
     case NavigationStore.repoDetails:
      return MaterialPageRoute(
        builder: (context) => Provider<RepositoryDetailsStore>(
          create: (context) => RepositoryDetailsStore(
            settings.arguments,
            context.inject<GithubRepoStore>(),
          ),
          child: RepositoryDetailsScreen(),
        ),
      );
    case NavigationStore.newRepo:
      return MaterialPageRoute(
        builder: (context) => Provider<NewRepositoryStore>(
          create: (context) => NewRepositoryStore(
            context.inject<GithubRepoStore>(),
          ),
          child: NewRepositoryScreen(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => CupertinoPageScaffold(
          child: Container(
            child: Center(
              child: Text('Not implemented page'),
            ),
          ),
        ),
      );
  }
};

