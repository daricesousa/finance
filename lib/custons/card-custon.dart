import 'package:financas/custons/color-custon.dart';
import 'package:financas/custons/text-custons.dart';
import 'package:financas/custons/dialog.dart';
import 'package:flutter/material.dart';

class CardCuston extends StatelessWidget {
  final void Function() onTap;
  final void Function() onLongPress;
  final void Function() delete;
  final String text;
  const CardCuston({
    Key? key,
    required this.text,
    required this.onTap,
    required this.onLongPress,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) async {
          delete();
        },
        background: _backgroudDelete(),
        child: _card(),
      ),
    );
  }

  Widget _backgroudDelete() {
    return Container(
      color: ColorCuston.primary,
      child: const Align(
        alignment: Alignment(0.9, 0),
        child: Icon(
          Icons.delete,
          color: ColorCuston.secundary,
        ),
      ),
    );
  }

  Widget _card() {
    return GestureDetector(
      child:
          Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text, textAlign: TextAlign.center, style: TextCustons.simples),
            ),
          ),
      onTap: () {
        onTap();
      },
      onLongPress: () {
        onLongPress();
      },
    );
  }
}
