import 'package:flutter/services.dart';
import 'package:entrega_aqui/core/utils/formatters.dart';

class BrDecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // mantém apenas números
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.isEmpty) {
      return const TextEditingValue(text: '');
    }

    // transforma em centavos
    final value = double.parse(text) / 100;

    final formatted = Formatters.numberBR(value);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
