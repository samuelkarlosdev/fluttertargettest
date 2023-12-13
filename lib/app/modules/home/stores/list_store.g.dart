// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  late final _$newListItemAtom =
      Atom(name: '_ListStore.newListItem', context: context);

  @override
  String get newListItem {
    _$newListItemAtom.reportRead();
    return super.newListItem;
  }

  @override
  set newListItem(String value) {
    _$newListItemAtom.reportWrite(value, super.newListItem, () {
      super.newListItem = value;
    });
  }

  late final _$listTempAtom =
      Atom(name: '_ListStore.listTemp', context: context);

  @override
  List<String>? get listTemp {
    _$listTempAtom.reportRead();
    return super.listTemp;
  }

  @override
  set listTemp(List<String>? value) {
    _$listTempAtom.reportWrite(value, super.listTemp, () {
      super.listTemp = value;
    });
  }

  late final _$getListItemSharedAsyncAction =
      AsyncAction('_ListStore.getListItemShared', context: context);

  @override
  Future<dynamic> getListItemShared() {
    return _$getListItemSharedAsyncAction.run(() => super.getListItemShared());
  }

  late final _$addListAsyncAction =
      AsyncAction('_ListStore.addList', context: context);

  @override
  Future<dynamic> addList() {
    return _$addListAsyncAction.run(() => super.addList());
  }

  late final _$removeListAsyncAction =
      AsyncAction('_ListStore.removeList', context: context);

  @override
  Future<dynamic> removeList(int item) {
    return _$removeListAsyncAction.run(() => super.removeList(item));
  }

  late final _$updateListAsyncAction =
      AsyncAction('_ListStore.updateList', context: context);

  @override
  Future<dynamic> updateList(int item) {
    return _$updateListAsyncAction.run(() => super.updateList(item));
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  void setNewListItem(String value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewListItem');
    try {
      return super.setNewListItem(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newListItem: ${newListItem},
listTemp: ${listTemp}
    ''';
  }
}
