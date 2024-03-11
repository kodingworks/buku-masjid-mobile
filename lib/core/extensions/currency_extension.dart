import 'package:intl/intl.dart';

/// Extension for formatting numeric values as Indonesian Rupiah (IDR).
extension CurrencyFormat on num {
  /// Formats the numeric value as Indonesian Rupiah (IDR).
  ///
  /// Returns the formatted string representing the numeric value in IDR format.
  String toIDR() {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'IDR ',
      decimalDigits: 0,
    );
    return formatCurrency.format(this);
  }
}
