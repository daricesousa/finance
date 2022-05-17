import 'package:financas/controllers/homeController.dart/groups-control.dart';
import 'package:financas/custons/card-custon.dart';
import 'package:financas/custons/dialog.dart';
import 'package:financas/custons/icon-app-bar.dart';
import 'package:financas/models/date.dart';
import 'package:financas/models/expense-group.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final controller = GroupsControl();
  @override
  Widget build(BuildContext context) {
    final date = ModalRoute.of(context)!.settings.arguments as Date;
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(date.title),
              centerTitle: true,
              actions: [
                iconReport(context: context, date: date),
                iconAdd(context: context, controller: controller, date: date),
              ],
            ),
            body: body(date),
          );
        });
  }

  body(Date date) {
    return ListView.builder(
        itemCount: date.groups.length,
        itemBuilder: (context, index) {
          return card(date, date.groups[index]);
        });
  }

  Widget card(Date date, ExpenseGroup group) {
    return CardCuston(
      text: group.title,
      price: "R\$ ${group.maxExpense.toStringAsFixed(2)}",
      onTap: () {
        Navigator.pushNamed(context, RoutesName.EXPENSES, arguments: group);
      },
      onLongPress: () {
        alertaShowDialog(
            context: context,
            title: "Editar grupo:",
            titleControl: group.title,
            priceControl: group.maxExpense.toStringAsFixed(2),
            confirmar: () {
              controller.editGroup(
                  group: group,
                  title: titleTextControl.text,
                  maxExpense: price.text);
            });
      },
      delete: () {
        controller.deleteGroup(date: date, group: group);
      },
    );
  }
}

Widget iconAdd({
  required BuildContext context,
  required GroupsControl controller,
  required Date date,
}) {
  return IconAppBar(
    onPressed: () {
      alertaShowDialog(
          context: context,
          title: "Novo grupo:",
          confirmar: () {
            controller.newGroup(
                date: date,
                title: titleTextControl.text,
                maxExpense: price.text);
          });
    },
    icon: Icons.add_circle,
  );
}

Widget iconReport({required BuildContext context, required Date date}) {
  return IconAppBar(
    onPressed: () {
      Navigator.pushNamed(context, RoutesName.REPORT_GROUPS,
          arguments: date.groups);
    },
    icon: Icons.note,
  );
}
