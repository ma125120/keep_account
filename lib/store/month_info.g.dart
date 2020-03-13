// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_info.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MonthInfo on _MonthInfo, Store {
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

  final _$dateAtom = Atom(name: '_MonthInfo.date');

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

  final _$listAtom = Atom(name: '_MonthInfo.list');

  @override
  List<Bill> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<Bill> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$_MonthInfoActionController = ActionController(name: '_MonthInfo');

  @override
  dynamic setDate(DateTime date) {
    final _$actionInfo = _$_MonthInfoActionController.startAction();
    try {
      return super.setDate(date);
    } finally {
      _$_MonthInfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},list: ${list.toString()},month: ${month.toString()},year: ${year.toString()},weekday: ${weekday.toString()}';
    return '{$string}';
  }
}
