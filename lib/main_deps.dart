import 'package:built_value/built_value.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:git_repo_test_case/domain/navigation_store.dart';

import 'data/repository/github_repository.dart';

part 'main_deps.g.dart';

abstract class AppDeps implements Built<AppDeps, AppDepsBuilder> {
  GithubRepository get gitRepository;

  NavigationStore get navigationStore;
  GithubRepoStore get githubRepoStore;
  
  AppDeps._();
  factory AppDeps([void Function(AppDepsBuilder) updates]) = _$AppDeps;
}