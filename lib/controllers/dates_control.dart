import 'dart:convert';
import 'package:financas/models/date.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatesControl extends ChangeNotifier {
  List<Date> _dateList = [];

  DatesControl() {
    readData();
  }

  List<Date> get dateList => _dateList;

  void newDate({required String title, required String salary}) {
    final newDate = Date(title);
    newDate.salary = double.tryParse(salary) ?? 0;
    _dateList.insertAll(0, [newDate]);
    salvarDates();
    notifyListeners();
  }

  void editDate(
      {required Date date, required String title, required String salary}) {
    date.salary = double.tryParse(salary) ?? 0;
    date.title = title;
    salvarDates();
    notifyListeners();
  }

  void deleteDate({required Date date}) {
    _dateList.removeWhere((element) => element.id == date.id);
    salvarDates();
    notifyListeners();
  }

  void readData() async {
    final prefs = await SharedPreferences.getInstance();
    String strFavorites = prefs.getString('data') ?? '[]';
    final dates = jsonDecode(strFavorites);
    _dateList = dates.map<Date>((e) => Date.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> salvarDates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> dates = _dateList.map((e) => e.toMap()).toList();
    print(jsonEncode(dates));
    prefs.setString("data", jsonEncode(dates));
  }
}
