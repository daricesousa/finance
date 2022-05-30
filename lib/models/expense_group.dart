import 'package:financas/models/expense.dart';

class ExpenseGroup {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title = '';
  List<Expense> expenses = [];
  final _totalExpense = 0.0;
  double maxExpense = 0;

  ExpenseGroup();

  ExpenseGroup.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    maxExpense = map["maxExpense"];
    expenses = map["expense"].map<Expense>((e) => Expense.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "maxExpense": maxExpense,
      "expense": expenses.map((e) => e.toMap()).toList(),
    };
    return map;
  }
}
