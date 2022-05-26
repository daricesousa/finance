
import 'package:financas/controllers/report_expenses_control.dart';
import 'package:financas/models/expense_group.dart';
import 'package:flutter/material.dart';

class ReportExpenses extends StatefulWidget {
  const ReportExpenses({Key? key}) : super(key: key);

  @override
  State<ReportExpenses> createState() => _ReportExpensesState();
}


class _ReportExpensesState extends State<ReportExpenses> {
final controller = ReportExpensesControl();

@override


  @override
  Widget build(BuildContext context) {
    final group = ModalRoute.of(context)!.settings.arguments as ExpenseGroup;
    controller.calcular(group);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(group.title),
          ),
          body: body(controller, group),
        );
      }
    );
  }
}

Widget body(ReportExpensesControl controller, ExpenseGroup group) {
  return ListView(
    children: [
      ListTile(
        title: Text('Máximo gasto: R\$ ${group.maxExpense}'),
      ),
      ListTile(
        title: Text('Total gasto: R\$ ${controller.totalExpense}'),
      ),
      ListTile(
        title: Text('Total restante:  R\$ ${controller.totalRemaining}'),
      ),
    ],
  );
}
