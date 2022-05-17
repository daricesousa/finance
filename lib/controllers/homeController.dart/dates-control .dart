import 'package:financas/models/date.dart';
import 'package:financas/models/expense-group.dart';
import 'package:flutter/material.dart';

class DatesControl extends ChangeNotifier {
  List<Date> _dateList = [];

  List<Date> get dateList => _dateList;

  void newDate({required String title, required String salary}) {
    final newDate = Date(title);
    newDate.salary = double.tryParse(salary) ?? 0;
    _dateList.insertAll(0, [newDate]);
    notifyListeners();
  }

  void editDate(
      {required Date date, required String title, required String salary}) {
    date.salary = double.tryParse(salary) ?? 0;
    date.title = title;
    notifyListeners();
  }

  void deleteDate({required Date date}) {
    _dateList.removeWhere((element) => element.id == date.id);
    notifyListeners();
  }
}
