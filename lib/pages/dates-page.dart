import 'package:financas/controllers/homeController.dart/dates-control%20.dart';
import 'package:financas/controllers/homeController.dart/groups-control.dart';
import 'package:financas/custons/card-custon.dart';
import 'package:financas/custons/dialog.dart';
import 'package:financas/custons/icon-app-bar.dart';
import 'package:financas/models/date.dart';
import 'package:financas/models/expense-group.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class DatesPage extends StatefulWidget {
  const DatesPage({Key? key}) : super(key: key);

  @override
  State<DatesPage> createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {
  final controller = DatesControl();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Finanças'),
              centerTitle: true,
              actions: [
                iconAdd(context, controller),
              ],
            ),
            body: body(),
          );
        });
  }

  body() {
    return ListView.builder(
        itemCount: controller.dateList.length,
        itemBuilder: (context, index) {
          return card(controller.dateList[index]);
        });
  }

  Widget card(Date date) {
    return CardCuston(
      text: date.title,
      price: "R\$ ${date.salary.toStringAsFixed(2)}",
      onTap: () {
        Navigator.pushNamed(context, RoutesName.GROUPS, arguments: date);
      },
      onLongPress: () {
        alertaShowDialog(
            context: context,
            title: "Editar data:",
            titleControl: date.title,
            priceControl: date.salary.toStringAsFixed(2),
            confirmar: () {
              controller.editDate(
                  date: date,
                  title: titleTextControl.text,
                  salary: price.text);
            });
      },
      delete: () {
        controller.deleteDate(date: date);
      },
    );
  }
}

Widget iconAdd(BuildContext context, DatesControl controller) {
  return IconAppBar(
    onPressed: () {
      alertaShowDialog(
          context: context,
          title: "Nova data:",
          confirmar: () {
            controller.newDate(
                title: titleTextControl.text, salary: price.text);
          });
    },
    icon: Icons.add_circle,
  );
}

