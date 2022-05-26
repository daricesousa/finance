import 'package:financas/models/expense_group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class ReportExpensesControl extends ChangeNotifier {

  double _totalExpense = 0;
  double _totalRemaining = 0;

  String get totalExpense => _totalExpense.toStringAsFixed(2);
  String get totalRemaining => _totalRemaining.toStringAsFixed(2);

  calcular(ExpenseGroup group){
    _totalExpense = 0;
    for (Expense expense in group.expenses){
      _totalExpense += expense.price;
    }

    _totalRemaining = group.maxExpense - _totalExpense;
    notifyListeners();
  }


}