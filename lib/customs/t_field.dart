import 'package:financas/customs/color_custom.dart';
import 'package:financas/customs/text_custom.dart';
import 'package:financas/models/enum_input_type.dart';
import 'package:financas/models/money_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final inputType input;
  final String? letra;
  final bool habilitado;

  const TField({
    Key? key,
    required this.controller,
    this.label,
    this.validator,
    this.letra,
    this.input = inputType.text,
    this.habilitado = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        autofocus: true,
        enabled: habilitado,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        cursorColor: ColorCuston.primary,
        decoration: decoration(),
        inputFormatters: inputFormatters(),
      ),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      labelText: label,
      labelStyle: TextCustom.simples,
      enabledBorder: border(),
      focusedBorder: border(),
    );
  }

  InputBorder border() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: ColorCuston.primary.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10));
  }

  List<TextInputFormatter> inputFormatters() {
    switch (input) {
      case inputType.price:
        return [MoneyMask()];
      case inputType.text:
        return [];
    }
  }

}
