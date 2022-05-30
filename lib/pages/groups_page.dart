import 'package:financas/controllers/dates_control.dart';
import 'package:financas/controllers/groups_control.dart';
import 'package:financas/customs/card_custom.dart';
import 'package:financas/customs/dialog.dart';
import 'package:financas/customs/icon_app_bar.dart';
import 'package:financas/models/date.dart';
import 'package:financas/models/expense_group.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  final Date date;
  final DatesControl datesControl;
  const GroupsPage({Key? key, required this.date, required this.datesControl})
      : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  late GroupsControl controller;
  @override
  void initState() {
    controller = GroupsControl(datesControl: widget.datesControl);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.date.title),
              centerTitle: true,
              actions: [
                iconReport(context: context, date: widget.date),
                iconAdd(
                    context: context,
                    controller: controller,
                    date: widget.date),
              ],
            ),
            body: body(widget.date),
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
    return CardCustom(
      text: group.title,
      price: "R\$ ${group.maxExpense.toStringAsFixed(2)}",
      onTap: () {
        Navigator.pushNamed(context, RoutesName.EXPENSES,
            arguments: {"group": group, "datesControl": widget.datesControl});
      },
      onLongPress: () {
        alertaShowDialog(
            context: context,
            title: "Editar grupo:",
            titleControl: group.title,
            priceControl: group.maxExpense.toStringAsFixed(2),
            confirmar: (text, price) {
              controller.editGroup(
                  group: group, title: text, maxExpense: price);
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
          confirmar: (text, price) {
            controller.newGroup(date: date, title: text, maxExpense: price);
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
