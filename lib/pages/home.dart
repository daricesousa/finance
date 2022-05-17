import 'package:financas/controllers/homeController.dart/home-control.dart';
import 'package:financas/custons/card-custon.dart';
import 'package:financas/custons/icon-app-bar.dart';
import 'package:financas/custons/text-custons.dart';
import 'package:financas/custons/dialog.dart';
import 'package:financas/models/expense-group.dart';
import 'package:financas/pages/groupPage.dart';
import 'package:financas/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeControl();
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
                iconReport(context, controller),
                iconAdd(context, controller),
              ],
            ),
            body: body(),
          );
        });
  }

  body() {
    return ListView.builder(
        itemCount: controller.listGroup.length,
        itemBuilder: (context, index) {
          return card_custon(controller.listGroup[index]);
        });
  }

  Widget card_custon(ExpenseGroup group) {
    return CardCuston(
      text: "${group.title}, ${group.maxExpense}",
      onTap: () {
        Navigator.pushNamed(context, RoutesName.GROUP, arguments: group);
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
        controller.deleteGroup(group: group);
      },
    );
  }
}

Widget iconAdd(BuildContext context, HomeControl controller) {
  return IconAppBar(
    onPressed: () {
      alertaShowDialog(
          context: context,
          title: "Novo grupo:",
          confirmar: () {
            controller.newGroup(
                title: titleTextControl.text, maxExpense: price.text);
          });
    },
    icon: Icons.add_circle,
  );
}

Widget iconReport(context, HomeControl controller) {
  return IconAppBar(
    onPressed: () {
      Navigator.pushNamed(context, RoutesName.REPORT,
          arguments: controller.listGroup);
    },
    icon: Icons.note,
  );
}
