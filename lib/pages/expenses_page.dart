import 'package:financas/controllers/dates_control.dart';
import 'package:financas/controllers/expenses_control.dart';
import 'package:financas/customs/card_custom.dart';
import 'package:financas/customs/icon_app_bar.dart';
import 'package:financas/customs/dialog.dart';
import 'package:financas/models/expense_group.dart';
import 'package:financas/models/expense.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  final DatesControl datesControl;
  final ExpenseGroup group;
  const ExpensesPage(
      {Key? key, required this.datesControl, required this.group})
      : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  late ExpensesControl controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = ExpensesControl(datesControl: widget.datesControl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.group.title),
              centerTitle: true,
              actions: [
                iconReport(context, widget.group),
                iconAdd(context, controller, widget.group),
              ],
            ),
            body: body(widget.group),
          );
        });
  }

  body(ExpenseGroup group) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: group.expenses.length,
              itemBuilder: (context, index) {
                return card(group, group.expenses[index]);
              });
        });
  }

  Widget card(ExpenseGroup group, Expense expense) {
    return CardCustom(
        text: expense.title,
        price: "R\$ ${expense.price.toStringAsFixed(2)}",
        onTap: () {
          dialog(context, expense, controller);
        },
        onLongPress: () {
          dialog(context, expense, controller);
        },
        delete: () {
          controller.deleteExpense(group: group, expense: expense);
        });
  }
}

Widget iconAdd(context, controller, group) {
  return IconAppBar(
    onPressed: () {
      alertaShowDialog(
          context: context,
          title: "Novo gasto:",
          confirmar: (text, price) {
            controller.newExpense(group: group, title: text, price: price);
          });
    },
    icon: Icons.add_circle,
  );
}

Widget iconReport(context, group) {
  return IconAppBar(
    onPressed: () {
      Navigator.pushNamed(context, RoutesName.REPORT_EXPENSES,
          arguments: group);
    },
    icon: Icons.note,
  );
}

Future<void> dialog(
    BuildContext context, Expense expense, ExpensesControl controller) async {
  await alertaShowDialog(
      context: context,
      title: "Novo gasto:",
      titleControl: expense.title,
      priceControl: expense.price.toStringAsFixed(2),
      confirmar: (text, price) {
        controller.editExpense(expense: expense, title: text, price: price);
      });
}
