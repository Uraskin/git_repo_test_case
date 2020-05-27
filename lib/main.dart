import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:git_repo_test_case/data/repository/github_repository.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:git_repo_test_case/domain/navigation_store.dart';
import 'package:git_repo_test_case/l10n/l10n.dart';
import 'package:git_repo_test_case/main_deps.dart';
import 'package:git_repo_test_case/ui/components/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deps = AppDeps((b) => b
    ..gitRepository = GithubRepository()
    
    ..navigationStore = NavigationStore()
    ..githubRepoStore = GithubRepoStore(b.gitRepository));

  runApp(MyApp(deps));
}

class MyApp extends StatelessWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();

  final AppDeps _deps;

  MyApp(this._deps);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => _deps.gitRepository,
        ),
        Provider(
          create: (_) => _deps.navigationStore,
        ),
         Provider(
          create: (_) => _deps.githubRepoStore,
        ),
      ],
      child: MaterialApp(
        title: Strings.of(context).appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          L10nsDelegate(),
        ],
        supportedLocales: [Locale('ru')],
        navigatorKey: navigatorKey,
        initialRoute: NavigationStore.splash,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}