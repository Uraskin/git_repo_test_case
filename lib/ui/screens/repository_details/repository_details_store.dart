import 'dart:async';

import 'package:git_repo_test_case/data/models/repo_models.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:mobx/mobx.dart';

part 'repository_details_store.g.dart';

class RepositoryDetailsArguments {
  final GithubRepo repo;

  RepositoryDetailsArguments(this.repo);
}

class RepositoryDetailsStore extends _RepositoryDetailsStoreBase
    with _$RepositoryDetailsStore {
  RepositoryDetailsStore(
    RepositoryDetailsArguments args,
    GithubRepoStore githubRepoStore,
  ) : super(args, githubRepoStore);
}

abstract class _RepositoryDetailsStoreBase with Store {
  final RepositoryDetailsArguments args;
  final GithubRepoStore _githubRepoStore;

  _RepositoryDetailsStoreBase(this.args, this._githubRepoStore);

  @computed
  bool get isLocalRepo => args.repo.local ?? false;

  @observable
  bool isSaved = false;

  @observable
  bool isLoading = false;

  @action
  Future saveRepository(String name, String description) async {
    isLoading = true;
    Timer(Duration(seconds: 2), () {
      var editRepo = args.repo.toBuilder();
      editRepo.update((b) => b
        ..name = name
        ..description = description);

      _githubRepoStore.onRepositoryUpdated(editRepo.build());
      isLoading = false;
      isSaved = true;
    });
  }
}
