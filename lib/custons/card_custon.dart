import 'package:financas/custons/color_custon.dart';
import 'package:financas/custons/text_custons.dart';
import 'package:financas/custons/dialog.dart';
import 'package:flutter/material.dart';

class CardCuston extends StatelessWidget {
  final void Function() onTap;
  final void Function() onLongPress;
  final void Function() delete;
  final String text;
  final String price;
  const CardCuston({
    Key? key,
    required this.text,
    this.price = '',
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
          child: _listTile()),
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

  Widget _listTile() {
    return ListTile(
      title: Align(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,
              textAlign: TextAlign.center, style: TextCustons.simples),
        ),
      ),
      trailing: Text(price),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
