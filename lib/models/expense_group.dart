import 'package:financas/models/expense.dart';

class ExpenseGroup {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title = '';
  List<Expense> expenses = [];
  double _totalExpense = 0;
  double maxExpense = 0;

  ExpenseGroup();

  ExpenseGroup.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    expenses = map["expense"];
    maxExpense = map["maxExpense"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "expense": expenses,
      "max-expense": maxExpense
    };
    return map;
  }
}
