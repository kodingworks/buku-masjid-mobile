import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// TextInputFormatter for formatting input as currency.
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final value = double.tryParse(newValue.text);

    if (value == null) return TextEditingValue.empty;

    final formatter = NumberFormat.decimalPattern();

    final newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
