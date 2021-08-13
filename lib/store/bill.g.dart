// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BillStore on _BillStore, Store {
  Computed<String> _$monthComputed;

  @override
  String get month =>
      (_$monthComputed ??= Computed<String>(() => super.month)).value;
  Computed<num> _$yearComputed;

  @override
  num get year => (_$yearComputed ??= Computed<num>(() => super.year)).value;
  Computed<String> _$weekdayComputed;

  @override
  String get weekday =>
      (_$weekdayComputed ??= Computed<String>(() => super.weekday)).value;

  final _$dateAtom = Atom(name: '_BillStore.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$incomeAtom = Atom(name: '_BillStore.income');

  @override
  double get income {
    _$incomeAtom.context.enforceReadPolicy(_$incomeAtom);
    _$incomeAtom.reportObserved();
    return super.income;
  }

  @override
  set income(double value) {
    _$incomeAtom.context.conditionallyRunInAction(() {
      super.income = value;
      _$incomeAtom.reportChanged();
    }, _$incomeAtom, name: '${_$incomeAtom.name}_set');
  }

  final _$outcomeAtom = Atom(name: '_BillStore.outcome');

  @override
  double get outcome {
    _$outcomeAtom.context.enforceReadPolicy(_$outcomeAtom);
    _$outcomeAtom.reportObserved();
    return super.outcome;
  }

  @override
  set outcome(double value) {
    _$outcomeAtom.context.conditionallyRunInAction(() {
      super.outcome = value;
      _$outcomeAtom.reportChanged();
    }, _$outcomeAtom, name: '${_$outcomeAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_BillStore.list');

  @override
  List<BillList> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<BillList> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$getAllAsyncAction = AsyncAction('getAll');

  @override
  Future getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$_BillStoreActionController = ActionController(name: '_BillStore');

  @override
  dynamic setDate(DateTime _date) {
    final _$actionInfo = _$_BillStoreActionController.startAction();
    try {
      return super.setDate(_date);
    } finally {
      _$_BillStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic computeCome(List<Bill> list) {
    final _$actionInfo = _$_BillStoreActionController.startAction();
    try {
      return super.computeCome(list);
    } finally {
      _$_BillStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},income: ${income.toString()},outcome: ${outcome.toString()},list: ${list.toString()},month: ${month.toString()},year: ${year.toString()},weekday: ${weekday.toString()}';
    return '{$string}';
  }
}
