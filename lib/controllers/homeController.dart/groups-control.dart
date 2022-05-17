
import 'package:financas/models/date.dart';
import 'package:financas/models/expense-group.dart';
import 'package:flutter/material.dart';

class GroupsControl extends ChangeNotifier {
 

 void newGroup({required Date date, required String title, required String maxExpense}){
      final newGroup = ExpenseGroup();
      newGroup.maxExpense = double.tryParse(maxExpense) ?? 0;
      newGroup.title = title;
      date.groups.add(newGroup);
      notifyListeners();
 }

 void editGroup({required ExpenseGroup group, required String title, required String maxExpense}){
      group.maxExpense = double.tryParse(maxExpense) ?? 0;
      group.title = title;
      notifyListeners();
 }

 void deleteGroup({required Date date, required ExpenseGroup group}){
    date.groups.removeWhere((element) => element.id == group.id);
    notifyListeners();

 }


}
