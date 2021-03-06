import 'package:financas/controllers/report_groups_control.dart';
import 'package:financas/models/expense_group.dart';
import 'package:flutter/material.dart';

class ReportGroups extends StatefulWidget {
  const ReportGroups({Key? key}) : super(key: key);

  @override
  State<ReportGroups> createState() => _ReportGroupsState();
}

class _ReportGroupsState extends State<ReportGroups> {
  final controller = ReportGroupsControl();

  @override
  @override
  Widget build(BuildContext context) {
    final listGroups =
        ModalRoute.of(context)!.settings.arguments as List<ExpenseGroup>;
    controller.calcular(listGroups);
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Relatório'),
            ),
            body: body(controller),
          );
        });
  }
}

Widget body(ReportGroupsControl controller) {
  return ListView(
    children: [
      ListTile(
        title: Text('Máximo gasto: R\$ ${controller.maxExpense}'),
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
