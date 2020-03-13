import 'package:keep_account/models/index.dart';
import 'package:keep_account/common/index.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'month_info.g.dart';

// This is the class used by rest of your codebase
class MonthInfo = _MonthInfo with _$MonthInfo;

// The store-class
abstract class _MonthInfo with Store {
  @observable
  DateTime date = MyDate.getNow();

  @observable
  List<Bill> list = [];

  @computed
  String get month => MyDate.format('MM', date);
  @computed
  num get year => date.year;

  @computed String get weekday => MyDate.weekday(date);

  @action
  setDate(DateTime date) {
    date = date;
  }
}