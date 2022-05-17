

import 'package:financas/controllers/homeController.dart/groups-control.dart';
import 'package:financas/controllers/homeController.dart/report-groups-control.dart';
import 'package:financas/models/expense-group.dart';
import 'package:financas/models/expense.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}


class _ReportState extends State<Report> {
final controller = ReportGroupsControl();

@override


  @override
  Widget build(BuildContext context) {
    final listGroups = ModalRoute.of(context)!.settings.arguments as List<ExpenseGroup>;
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
      }
    );
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
