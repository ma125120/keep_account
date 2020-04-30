import 'package:keep_account/data/bill.dart';
import 'package:keep_account/models/index.dart';
import 'package:keep_account/common/index.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'bill.g.dart';

// This is the class used by rest of your codebase
class BillStore = _BillStore with _$BillStore;

// The store-class
abstract class _BillStore with Store {
  @observable
  DateTime date = MyDate.getNow();

  @observable
  List<Bill> list = [];

  @computed
  String get month => MyDate.format('MM', date);
  @computed
  num get year => date.year;

  @computed
  String get weekday => MyDate.weekday(date);

  @action
  setDate(DateTime _date) {
    date = _date;
  }

  @action
  getAll() async {
    List _list = await billProvider.getBills();
    list = _list;
  }
}
