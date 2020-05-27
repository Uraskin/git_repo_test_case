// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GithubRepoStore on _GithubRepoStoreBase, Store {
  Computed<bool> _$noSearchComputed;

  @override
  bool get noSearch =>
      (_$noSearchComputed ??= Computed<bool>(() => super.noSearch,
              name: '_GithubRepoStoreBase.noSearch'))
          .value;
  Computed<ObservableList<GithubRepo>> _$repositoriesComputed;

  @override
  ObservableList<GithubRepo> get repositories => (_$repositoriesComputed ??=
          Computed<ObservableList<GithubRepo>>(() => super.repositories,
              name: '_GithubRepoStoreBase.repositories'))
      .value;

  final _$isLoadingAtom = Atom(name: '_GithubRepoStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorAtom = Atom(name: '_GithubRepoStoreBase.error');

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$searchQueryAtom = Atom(name: '_GithubRepoStoreBase.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$_localRepositoriesAtom =
      Atom(name: '_GithubRepoStoreBase._localRepositories');

  @override
  ObservableMap<int, GithubRepo> get _localRepositories {
    _$_localRepositoriesAtom.reportRead();
    return super._localRepositories;
  }

  @override
  set _localRepositories(ObservableMap<int, GithubRepo> value) {
    _$_localRepositoriesAtom.reportWrite(value, super._localRepositories, () {
      super._localRepositories = value;
    });
  }

  final _$_remoteRepositoriesAtom =
      Atom(name: '_GithubRepoStoreBase._remoteRepositories');

  @override
  ObservableList<GithubRepo> get _remoteRepositories {
    _$_remoteRepositoriesAtom.reportRead();
    return super._remoteRepositories;
  }

  @override
  set _remoteRepositories(ObservableList<GithubRepo> value) {
    _$_remoteRepositoriesAtom.reportWrite(value, super._remoteRepositories, () {
      super._remoteRepositories = value;
    });
  }

  final _$searchRepositoriesAsyncAction =
      AsyncAction('_GithubRepoStoreBase.searchRepositories');

  @override
  Future<dynamic> searchRepositories(String query) {
    return _$searchRepositoriesAsyncAction
        .run(() => super.searchRepositories(query));
  }

  final _$onRepositoryUpdatedAsyncAction =
      AsyncAction('_GithubRepoStoreBase.onRepositoryUpdated');

  @override
  Future<dynamic> onRepositoryUpdated(GithubRepo repo) {
    return _$onRepositoryUpdatedAsyncAction
        .run(() => super.onRepositoryUpdated(repo));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
searchQuery: ${searchQuery},
noSearch: ${noSearch},
repositories: ${repositories}
    ''';
  }
}
