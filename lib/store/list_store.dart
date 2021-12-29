import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newToDoTitle = '';

  @action
  void setNewToDoTitle(String value) => newToDoTitle = value;
}
