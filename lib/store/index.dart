export './counter.dart';
export './todo.dart';
export './bill.dart';
export 'package:flutter_mobx/flutter_mobx.dart';

import './counter.dart';
import './bill.dart';

class MyStore {
  static final counter = new Counter();
  static final billStore = new BillStore();
}
