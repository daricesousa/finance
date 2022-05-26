import 'package:financas/custons/color_custon.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final bool loading;
  const Button({Key? key, required this.onPressed, this.loading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 45,
      width: 1000,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorCuston.primary),
        ),
        child: const Text(
          'Salvar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
