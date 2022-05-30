import 'package:financas/controllers/convert.dart';
import 'package:financas/controllers/dates_control.dart';
import 'package:financas/models/expense_group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesControl extends ChangeNotifier {
  final DatesControl datesControl;
  ExpensesControl({required this.datesControl});

  void newExpense({
    required ExpenseGroup group,
    required String title,
    required String price,
  }) async {
    final newExpense = Expense();
    group.expenses.add(newExpense);
    editExpense(expense: newExpense, title: title, price: price);
  }

  void editExpense(
      {required Expense expense,
      required String title,
      required String price}) async {
    expense.price = Convert.realForDouble(price);
    expense.title = title;
    await datesControl.saveDate();
    notifyListeners();
  }

  void deleteExpense(
      {required ExpenseGroup group, required Expense expense}) async {
    group.expenses.removeWhere((element) => element.id == expense.id);
    await datesControl.saveDate();
    notifyListeners();
  }
}
