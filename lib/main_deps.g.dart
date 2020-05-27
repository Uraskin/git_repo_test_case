// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_deps.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppDeps extends AppDeps {
  @override
  final GithubRepository gitRepository;
  @override
  final NavigationStore navigationStore;
  @override
  final GithubRepoStore githubRepoStore;

  factory _$AppDeps([void Function(AppDepsBuilder) updates]) =>
      (new AppDepsBuilder()..update(updates)).build();

  _$AppDeps._({this.gitRepository, this.navigationStore, this.githubRepoStore})
      : super._() {
    if (gitRepository == null) {
      throw new BuiltValueNullFieldError('AppDeps', 'gitRepository');
    }
    if (navigationStore == null) {
      throw new BuiltValueNullFieldError('AppDeps', 'navigationStore');
    }
    if (githubRepoStore == null) {
      throw new BuiltValueNullFieldError('AppDeps', 'githubRepoStore');
    }
  }

  @override
  AppDeps rebuild(void Function(AppDepsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppDepsBuilder toBuilder() => new AppDepsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppDeps &&
        gitRepository == other.gitRepository &&
        navigationStore == other.navigationStore &&
        githubRepoStore == other.githubRepoStore;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, gitRepository.hashCode), navigationStore.hashCode),
        githubRepoStore.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppDeps')
          ..add('gitRepository', gitRepository)
          ..add('navigationStore', navigationStore)
          ..add('githubRepoStore', githubRepoStore))
        .toString();
  }
}

class AppDepsBuilder implements Builder<AppDeps, AppDepsBuilder> {
  _$AppDeps _$v;

  GithubRepository _gitRepository;
  GithubRepository get gitRepository => _$this._gitRepository;
  set gitRepository(GithubRepository gitRepository) =>
      _$this._gitRepository = gitRepository;

  NavigationStore _navigationStore;
  NavigationStore get navigationStore => _$this._navigationStore;
  set navigationStore(NavigationStore navigationStore) =>
      _$this._navigationStore = navigationStore;

  GithubRepoStore _githubRepoStore;
  GithubRepoStore get githubRepoStore => _$this._githubRepoStore;
  set githubRepoStore(GithubRepoStore githubRepoStore) =>
      _$this._githubRepoStore = githubRepoStore;

  AppDepsBuilder();

  AppDepsBuilder get _$this {
    if (_$v != null) {
      _gitRepository = _$v.gitRepository;
      _navigationStore = _$v.navigationStore;
      _githubRepoStore = _$v.githubRepoStore;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppDeps other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppDeps;
  }

  @override
  void update(void Function(AppDepsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppDeps build() {
    final _$result = _$v ??
        new _$AppDeps._(
            gitRepository: gitRepository,
            navigationStore: navigationStore,
            githubRepoStore: githubRepoStore);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
