import 'package:financas/controllers/convert.dart';
import 'package:financas/customs/button_custom.dart';
import 'package:financas/customs/t_field.dart';
import 'package:financas/customs/text_custom.dart';
import 'package:financas/models/enum_input_type.dart';
import 'package:flutter/material.dart';


Future<void> alertaShowDialog({
  required BuildContext context,
  required Function(String, String)? confirmar,
  String title = '',
  String titleControl = '',
  double priceControl = 0,
})async {
  final titleTextControl = TextEditingController();
  final price = TextEditingController();
  await showDialog(
    context: context,
    builder: (context) {
      titleTextControl.text = titleControl;
      price.text = Convert.doubleForTextControllerPrice(priceControl);
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
              TField(controller: price, label: "Valor", input: inputType.price),
            ],
          ),
        ),
        actions: <Widget>[
          Button(onPressed: () {
            confirmar!(titleTextControl.text, price.text);
            Navigator.pop(context);
          }),
        ],
      );
    },
  );
  
}
