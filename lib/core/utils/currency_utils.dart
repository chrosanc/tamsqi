import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyUtils {

  String currencyFormat(int amount) {
    String inLocaleCurrency =
    CurrencyFormatter.format(amount, CurrencyFormat.fromLocale('id_ID')!);
    return inLocaleCurrency;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Jika input kosong atau hanya prefix, kembalikan saja
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Hanya ambil angka dari input
    String numberOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final number = int.tryParse(numberOnly) ?? 0;

    // Gunakan CurrencyFormatter untuk memformat angka
    String formattedCurrency = CurrencyFormatter.format(
      number,
      CurrencyFormat.fromLocale('id_ID')!,
    );

    // Perbaiki tampilan dengan menambahkan prefix Rp.

    return TextEditingValue(
      text: formattedCurrency,
      selection: TextSelection.collapsed(offset: formattedCurrency.length),
    );
  }
}

