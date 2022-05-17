import 'package:financas/controllers/homeController.dart/report-group-control.dart';
import 'package:financas/models/expense-group.dart';
import 'package:flutter/material.dart';

class ReportGroup extends StatefulWidget {
  const ReportGroup({Key? key}) : super(key: key);

  @override
  State<ReportGroup> createState() => _ReportGroupState();
}


class _ReportGroupState extends State<ReportGroup> {
final controller = ReportGroupControl();

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

Widget body(ReportGroupControl controller, ExpenseGroup group) {
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
