import 'package:financas/controllers/dates_control.dart';
import 'package:financas/models/expense_group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesControl extends ChangeNotifier {
  final DatesControl datesControl;
  ExpensesControl({required this.datesControl});

  void newExpense(
      {required ExpenseGroup group,
      required String title,
      required String price}) async {
    final newExpense = Expense();
    newExpense.price = double.tryParse(price) ?? 0;
    newExpense.title = title;
    group.expenses.add(newExpense);
    await datesControl.salvarDates();
    notifyListeners();
  }

  void editExpense(
      {required Expense expense,
      required String title,
      required String price}) async {
    expense.price = double.tryParse(price) ?? 0;
    expense.title = title;
    await datesControl.salvarDates();
    notifyListeners();
  }

  void deleteExpense(
      {required ExpenseGroup group, required Expense expense}) async {
    group.expenses.removeWhere((element) => element.id == expense.id);
    await datesControl.salvarDates();
    notifyListeners();
  }
}
