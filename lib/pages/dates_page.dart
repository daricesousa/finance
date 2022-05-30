import 'package:financas/controllers/convert.dart';
import 'package:financas/controllers/dates_control.dart';
import 'package:financas/customs/card_custom.dart';
import 'package:financas/customs/dialog.dart';
import 'package:financas/customs/icon_app_bar.dart';
import 'package:financas/models/date.dart';
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
    return CardCustom(
      text: date.title,
      price: Convert.doubleForReal(date.salary),
      onTap: () {
        Navigator.pushNamed(context, RoutesName.GROUPS,
            arguments: {"date": date, "datesControl": controller});
      },
      onLongPress: () async {
        await alertaShowDialog(
            context: context,
            title: "Editar data:",
            titleControl: date.title,
            priceControl: date.salary,
            confirmar: (title, price) {
              controller.editDate(
                date: date,
                title: title,
                salary: price,
              );
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
          confirmar: (String title, String price) {
            controller.newDate(
                title: title, salary: price);
          });
    },
    icon: Icons.add_circle,
  );
}
