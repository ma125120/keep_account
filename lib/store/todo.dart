import 'package:mobx/mobx.dart';
import 'package:keep_account/data/todo.dart';

// Include generated file
part 'todo.g.dart';

// This is the class used by rest of your codebase
class TodoStore = _TodoStore with _$TodoStore;

// The store-class
abstract class _TodoStore with Store {
  @observable
  List<Todo> list;

  @action
  void setList(newList) {
    list = newList;
  }
}