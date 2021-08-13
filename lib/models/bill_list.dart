import 'package:keep_account/models/bill.dart';

class BillList {
  String dateStr;
  List<Bill> children;
  double total;

  BillList({
    this.dateStr,
    this.children,
    this.total,
  });
}
