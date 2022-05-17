
import 'package:financas/models/expense-group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesControl extends ChangeNotifier {
 
 void newExpense({required ExpenseGroup group, required String title, required String price}){
      final newExpense = Expense();
      newExpense.price = double.tryParse(price) ?? 0;
      newExpense.title = title;
      group.expense.add(newExpense);
      notifyListeners();
 }

 void editExpense({required Expense expense, required String title, required String price}){
      expense.price = double.tryParse(price) ?? 0;
      expense.title = title;
      notifyListeners();
 }

  void deleteExpense({required ExpenseGroup group,required Expense expense}){
    group.expense.removeWhere((element) => element.id == expense.id);
  }


}
