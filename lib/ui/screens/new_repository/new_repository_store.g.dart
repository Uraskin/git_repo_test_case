// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_repository_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewRepositoryStore on _NewRepositoryStoreBase, Store {
  final _$isSavedAtom = Atom(name: '_NewRepositoryStoreBase.isSaved');

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

  final _$isLoadingAtom = Atom(name: '_NewRepositoryStoreBase.isLoading');

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
      AsyncAction('_NewRepositoryStoreBase.saveRepository');

  @override
  Future<dynamic> saveRepository(String name, String description) {
    return _$saveRepositoryAsyncAction
        .run(() => super.saveRepository(name, description));
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved},
isLoading: ${isLoading}
    ''';
  }
}
