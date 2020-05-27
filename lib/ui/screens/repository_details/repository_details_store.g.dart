// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoryDetailsStore on _RepositoryDetailsStoreBase, Store {
  Computed<bool> _$isLocalRepoComputed;

  @override
  bool get isLocalRepo =>
      (_$isLocalRepoComputed ??= Computed<bool>(() => super.isLocalRepo,
              name: '_RepositoryDetailsStoreBase.isLocalRepo'))
          .value;

  final _$isSavedAtom = Atom(name: '_RepositoryDetailsStoreBase.isSaved');

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RepositoryDetailsStoreBase.isLoading');

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

  final _$saveRepositoryAsyncAction =
      AsyncAction('_RepositoryDetailsStoreBase.saveRepository');

  @override
  Future<dynamic> saveRepository(String name, String description) {
    return _$saveRepositoryAsyncAction
        .run(() => super.saveRepository(name, description));
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved},
isLoading: ${isLoading},
isLocalRepo: ${isLocalRepo}
    ''';
  }
}
