import 'package:financas/models/expense_group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class ReportGroupsControl extends ChangeNotifier {
  double _totalExpense = 0;
  double _maxExpense = 0;
  double _totalRemaining = 0;

  String get totalExpense => _totalExpense.toStringAsFixed(2);
  String get totalRemaining => _totalRemaining.toStringAsFixed(2);
  String get maxExpense => _maxExpense.toStringAsFixed(2);

  calcular(List<ExpenseGroup> listGroups) {
    _totalExpense = 0;
    _maxExpense = 0;
    for (ExpenseGroup group in listGroups) {
      _maxExpense += group.maxExpense;
      for (Expense expense in group.expenses) {
        _totalExpense += expense.price;
      }

      _totalRemaining = _maxExpense - _totalExpense;
      notifyListeners();
    }
  }
}
