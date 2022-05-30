import 'package:financas/models/expense_group.dart';

class Date {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title = '';
  double salary = 0;
  List<ExpenseGroup> groups = [];

  Date(this.title);

  Date.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    salary = map["salary"];
    groups = map["groups"].map<ExpenseGroup>((e) => ExpenseGroup.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "salary": salary,
      "groups": groups.map((e) => e.toMap()).toList(),
    };
    return map;
  }
}
