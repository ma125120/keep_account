export './counter.dart';
export './todo.dart';
export './month_info.dart';
export 'package:flutter_mobx/flutter_mobx.dart';

import './counter.dart';
import './month_info.dart';

class MyStore {
  static final counter = new Counter();
  static final monthInfo = new MonthInfo();
}