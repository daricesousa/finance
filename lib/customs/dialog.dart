import 'package:financas/customs/button_custom.dart';
import 'package:financas/customs/t_field.dart';
import 'package:financas/customs/text_custom.dart';
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
          style: TextCustom.simples,
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
