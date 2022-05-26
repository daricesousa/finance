import 'package:financas/custons/button_custon.dart';
import 'package:financas/custons/t_field.dart';
import 'package:financas/custons/text_custons.dart';
import 'package:flutter/material.dart';

final titleTextControl = TextEditingController();
final price = TextEditingController();

void alertaShowDialog({
  required BuildContext context,
  required Function()? confirmar,
  String title = '',
  String titleControl = '',
  String priceControl = '',
}) {
  showDialog(
    context: context,
    builder: (context) {
      titleTextControl.text = titleControl;
      price.text = priceControl;
      return AlertDialog(
        title: Text(
          title,
          style: TextCustons.simples,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TField(controller: titleTextControl, label: "Titulo"),
              TField(controller: price, label: "Valor"),
            ],
          ),
        ),
        actions: <Widget>[
          Button(onPressed: () {
            Navigator.pop(context);
            confirmar!();
          }),
        ],
      );
    },
  );
}

