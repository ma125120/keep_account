import 'package:keep_account/data/bill.dart';
import 'package:keep_account/models/bill_list.dart';
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
  double income = 0;
  @observable
  double outcome = 0;
  @computed
  double get total => income - outcome;

  @observable
  List<BillList> list = [];

  @computed
  String get month => MyDate.format('MM', date);
  @computed
  num get year => date.year;

  @computed
  String get weekday => MyDate.weekday(date);

  @action
  setDate(DateTime _date) {
    date = _date;
    getAll();
  }

  @action
  getAll() async {
    List<BillList> _list = [];
    List<Bill> listData =
        await billProvider.getBillsByDate(MyDate.format('yyyy-MM', date));

    if (listData == null) {
      list = [];
      income = 0;
      outcome = 0;
      return;
    }

    computeCome(listData);
    // 计算已有的日期
    List dates = listData.map((v) => v.dateStr).toSet().toList();
    _list = dates.map((v) {
      String str = v;
      // 该日期下所有的收入支出
      List<Bill> __list = listData.where((v) => v.dateStr == str).toList();

      return BillList(
          dateStr: str,
          total: __list.length == 1
              ? __list.first.realPrice
              : __list
                  .map((v) => v.realPrice)
                  .reduce((prev, next) => prev + next),
          children: __list);
    }).toList();
    list = _list;
  }

  @action
  computeCome(List<Bill> list) {
    if (list == null) return;

    income = getCome(list, 1);
    outcome = getCome(list, 0);
  }

  getCome(List<Bill> list, int type) {
    List<Bill> _list = list.where((v) => v.type == type).toList();
    if (_list.length == 1) {
      return _list.first.price;
    } else if (_list.length > 1) {
      return _list.map((v) => v.price).reduce((prev, next) => prev + next);
    }

    return 0.0;
  }
}

BillStore billStore = BillStore();
