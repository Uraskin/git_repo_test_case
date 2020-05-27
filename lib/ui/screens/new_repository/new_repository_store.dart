import 'dart:async';
import 'dart:math';

import 'package:git_repo_test_case/data/models/repo_models.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:mobx/mobx.dart';

part 'new_repository_store.g.dart';

class NewRepositoryStore extends _NewRepositoryStoreBase
    with _$NewRepositoryStore {
  NewRepositoryStore(
    GithubRepoStore githubRepoStore,
  ) : super(githubRepoStore);
}

abstract class _NewRepositoryStoreBase with Store {
  final GithubRepoStore _githubRepoStore;

  _NewRepositoryStoreBase(this._githubRepoStore);

  @observable
  bool isSaved = false;

  @observable
  bool isLoading = false;

  @action
  Future saveRepository(String name, String description) async {
    isLoading = true;
    Timer(Duration(seconds: 2), () {
      var newRepo = GithubRepo((b) => b
        ..id = Random().nextInt(99999)
        ..name = name
        ..description = description
        ..local = true);
        
      _githubRepoStore.onRepositoryUpdated(newRepo);

      isLoading = false;
      isSaved = true;
    });
  }
}
