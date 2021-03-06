import 'dart:convert';
import 'package:financas/controllers/convert.dart';
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
    _dateList.insertAll(0, [newDate]);
    editDate(date: newDate, title: title, salary: salary);
  }

  void editDate(
      {required Date date, required String title, required String salary}) {
    date.salary = Convert.realForDouble(salary);
    date.title = title;
    saveDate();
    notifyListeners();
  }

  void deleteDate({required Date date}) {
    _dateList.removeWhere((element) => element.id == date.id);
    saveDate();
    notifyListeners();
  }

  void readData() async {
    final prefs = await SharedPreferences.getInstance();
    String strFavorites = prefs.getString('data') ?? '[]';
    final dates = jsonDecode(strFavorites);
    _dateList = dates.map<Date>((e) => Date.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> saveDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> dates = _dateList.map((e) => e.toMap()).toList();
    prefs.setString("data", jsonEncode(dates));
  }
}
