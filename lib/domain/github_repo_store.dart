import 'package:git_repo_test_case/data/models/repo_models.dart';
import 'package:git_repo_test_case/data/repository/github_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:git_repo_test_case/ext/ext.dart';

part 'github_repo_store.g.dart';

class GithubRepoStore extends _GithubRepoStoreBase with _$GithubRepoStore {
  GithubRepoStore(GithubRepository githubRepository) : super(githubRepository);
}

abstract class _GithubRepoStoreBase with Store {
  final GithubRepository _githubRepository;

  _GithubRepoStoreBase(this._githubRepository);

  @observable
  bool isLoading = false;

  @observable
  dynamic error;

  @observable
  String searchQuery;

  @computed
  bool get noSearch => searchQuery.isNullEmptyOrWhitespace;

  @observable
  ObservableMap<int, GithubRepo> _localRepositories = ObservableMap();

  @observable
  ObservableList<GithubRepo> _remoteRepositories = ObservableList();

  @computed
  ObservableList<GithubRepo>  get repositories => noSearch ? _localRepositories.values.toObservableList() : _remoteRepositories;

  @action
  Future searchRepositories(String query) async {
    error = null;
   
    final currentQuery = query.trim().toLowerCase();
    if (searchQuery == currentQuery && error == null) {
      return;
    }
    if (currentQuery.length == 0) {
      searchQuery = null;
      return;
    }
    searchQuery = currentQuery;
    isLoading = true;

    _remoteRepositories = ObservableList();
    try {
      final result = await _githubRepository.getSearchResult(query);
      _remoteRepositories = result.items.toObservableList();
    } catch (e) {
      error = e;
    }
    isLoading = false;
  }

  @action
  Future onRepositoryUpdated(GithubRepo repo) async {
    _localRepositories[repo.id] = repo;
  }
}
