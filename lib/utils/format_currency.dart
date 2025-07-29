import 'package:intl/intl.dart';

class FormatCurrency {
  /// Format số có dấu phân cách, không có đơn vị
  static String compact(num number) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(number);
  }

  /// Format tiền Việt Nam (₫), không có phần thập phân
  static String vnd(num number) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }

  /// Format USD (hoặc tiền khác), có thể chỉnh số thập phân
  static String currency(num number, int decimalDigits) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      decimalDigits: decimalDigits,
    );
    return formatter.format(number);
  }

  /// Format rút gọn (1.5K, 2.3M, etc.)
  static String short(num number) {
    return NumberFormat.compact(locale: 'en_US').format(number);
  }
}
