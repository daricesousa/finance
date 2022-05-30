
import 'package:financas/controllers/convert.dart';
import 'package:financas/controllers/dates_control.dart';
import 'package:financas/models/date.dart';
import 'package:financas/models/expense_group.dart';
import 'package:flutter/material.dart';

class GroupsControl extends ChangeNotifier {
 
final DatesControl datesControl;

GroupsControl(
  {required this.datesControl}
);
 void newGroup({required Date date, required String title, required String maxExpense})async{
      final newGroup = ExpenseGroup();
      date.groups.add(newGroup);
      editGroup(group: newGroup, title: title, maxExpense: maxExpense);
      newGroup.maxExpense = Convert.realForDouble(maxExpense);
      newGroup.title = title;
      await datesControl.salvarDates();
      notifyListeners();
 }

 void editGroup({required ExpenseGroup group, required String title, required String maxExpense})async{
      group.maxExpense = Convert.realForDouble(maxExpense) ;
      group.title = title;
      await datesControl.salvarDates();
      notifyListeners();
 }

 void deleteGroup({required Date date, required ExpenseGroup group})async{
    date.groups.removeWhere((element) => element.id == group.id);
    await datesControl.salvarDates();
    notifyListeners();

 }


}
