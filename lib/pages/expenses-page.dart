import 'package:financas/controllers/homeController.dart/expenses-control.dart';
import 'package:financas/controllers/homeController.dart/groups-control.dart';
import 'package:financas/custons/card-custon.dart';
import 'package:financas/custons/icon-app-bar.dart';
import 'package:financas/custons/text-custons.dart';
import 'package:financas/custons/dialog.dart';
import 'package:financas/models/expense-group.dart';
import 'package:financas/models/expense.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final controller = ExpensesControl();
  @override
  Widget build(BuildContext context) {
    final group = ModalRoute.of(context)!.settings.arguments as ExpenseGroup;
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(group.title),
              centerTitle: true,
              actions: [
                iconReport(context, group),
                iconAdd(context, controller, group),
              ],
            ),
            body: body(group),
          );
        });
  }

  body(ExpenseGroup group) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: group.expense.length,
              itemBuilder: (context, index) {
                return card(group, group.expense[index]);
              });
        });
  }

  Widget card(ExpenseGroup group, Expense expense) {
    return CardCuston(
        text: "${expense.title}, ${expense.price}",
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
          confirmar: () {
            controller.newExpense(
                group: group, title: titleTextControl.text, price: price.text);
          });
    },
    icon: Icons.add_circle,
  );
}

Widget iconReport(context, group) {
  return IconAppBar(
    onPressed: () {
      Navigator.pushNamed(context, RoutesName.REPORT_GROUP, arguments: group);
    },
    icon: Icons.note,
  );
}

void dialog(BuildContext context, Expense expense, ExpensesControl controller) {
  return alertaShowDialog(
      context: context,
      title: "Novo gasto:",
      titleControl: expense.title,
      priceControl: expense.price.toStringAsFixed(2),
      confirmar: () {
        controller.editExpense(
            expense: expense, title: titleTextControl.text, price: price.text);
      });
}
