import 'package:mobx/mobx.dart';
import 'package:to_do_app/store/to_do/to_do_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newToDoTitle = '';

  @action
  void setNewToDoTitle(String value) => newToDoTitle = value;

  @computed
  bool get isFormValid => newToDoTitle.isNotEmpty;

  ObservableList<ToDoStore> toDoList = ObservableList<ToDoStore>();

  @action
  void addToDoList() {
    toDoList.insert(0, ToDoStore(newToDoTitle));
    newToDoTitle = '';
  }
}
