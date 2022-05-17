
import 'package:financas/models/expense-group.dart';
import 'package:flutter/material.dart';

class GroupsControl extends ChangeNotifier {
 

 List<ExpenseGroup>_listGroup = [];

 get listGroup => _listGroup;

 void newGroup({required String title, required String maxExpense}){
      final newGroup = ExpenseGroup();
      newGroup.maxExpense = double.tryParse(maxExpense) ?? 0;
      newGroup.title = title;
      _listGroup.add(newGroup);
      notifyListeners();
 }

 void editGroup({required ExpenseGroup group, required String title, required String maxExpense}){
      group.maxExpense = double.tryParse(maxExpense) ?? 0;
      group.title = title;
      notifyListeners();
 }

 void deleteGroup({required ExpenseGroup group}){
  //  listGroup.remove(group.id);
  //   int indexGroupDelete = listGroup.indexWhere((element) => element.id == group.id);
    _listGroup.removeWhere((element) => element.id == group.id);
    // await Arquivo.saveData(_lista);
    notifyListeners();

 }


}
