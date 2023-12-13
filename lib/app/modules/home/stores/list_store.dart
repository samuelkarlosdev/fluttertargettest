import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

const String keyList = "itemListTest";

abstract class _ListStore with Store {
  @observable
  String newListItem = "";

  @action
  void setNewListItem(String value) => newListItem = value;

  final ObservableList<String> listItem = ObservableList<String>();

  @observable
  List<String>? listTemp = List<String>.of([]);

  @action
  Future getListItemShared() async {
    var shared = await SharedPreferences.getInstance();
    listTemp = shared.getStringList(keyList);
    debugPrint("listTemp $listTemp");
    if (listTemp != null) {
      listItem.addAll(listTemp!.toList());
    }
    debugPrint("listStoreItem $listItem");
  }

  @action
  Future addList() async {
    var shared = await SharedPreferences.getInstance();
    listItem.add(newListItem);
    shared.setStringList(keyList, listItem);
  }

  @action
  Future removeList(int item) async {
    var shared = await SharedPreferences.getInstance();
    listItem.removeAt(item);
    shared.setStringList(keyList, listItem);
  }

  @action
  Future updateList(int item) async {
    var shared = await SharedPreferences.getInstance();
    listItem[item] = newListItem;
    shared.setStringList(keyList, listItem);
  }
}
