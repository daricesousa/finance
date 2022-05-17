import 'package:financas/models/expense-group.dart';

class Date{
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title;
  double salary = 0;
  List<ExpenseGroup> groups = [];


  Date(this.title);

}