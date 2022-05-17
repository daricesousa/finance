import 'package:flutter/material.dart';

class IconAppBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData? icon;

  const IconAppBar({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}
