import 'package:flutter/material.dart';

import '../models/money_mask.dart';

class Convert{

  static double realForDouble(String text) {
    String value =
        text.replaceAll(".", "").replaceAll(",", ".").replaceAll("R\$", "");
    return double.tryParse(value) ?? 0;
  }

  static String doubleForReal(double price) {
    return "R\$ ${price.toStringAsFixed(2).replaceAll(".", ",")}";
  }

  static String doubleForTextControllerPrice(double price){
    String text = price.toStringAsFixed(2);
    final valor = TextEditingValue(text: text);
    return MoneyMask().formatEditUpdate(valor, valor).text;
  }
}