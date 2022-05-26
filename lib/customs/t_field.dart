import 'package:financas/customs/color_custom.dart';
import 'package:financas/customs/text_custom.dart';
import 'package:flutter/material.dart';

class TField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  // final tipoInput tipo;
  final String? letra;
  final bool habilitado;

  const TField({
    Key? key,
    required this.controller,
    this.label,
    this.validator,
    this.letra,
    this.habilitado = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        enabled: habilitado,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        cursorColor: ColorCuston.primary,
        decoration: decoration(),
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

  // List<TextInputFormatter> inputFormatters() {
  //   switch (tipo) {
  //     case tipoInput.preco:
  //       return [MoneyMask()];
  //     case tipoInput.peso:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp("[0-9.,]")),
  //         LengthLimitingTextInputFormatter(7),
  //       ];
  //     case tipoInput.titulo:
  //       return [];
  //   }
  // }

}
