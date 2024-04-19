import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension FormatterPrice on Decimal {
  /// Расшение для форматирования цены в денежный формат "1 234,56 Р"
  String toFormattedCurrency({String? symbol, int? decimalDigits}) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'Ru_ru',
      symbol: symbol ?? 'Р',
      decimalDigits: decimalDigits ?? 2,
    );

    return currencyFormatter.format(DecimalIntl(this));
  }
}
