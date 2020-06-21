import 'package:intl/intl.dart';

String greeting({DateTime dateTime}) {
  dateTime ??= DateTime.now();

  final hour = dateTime.hour;

  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

String getCurrencyFormated(num amount) {
  final currency = NumberFormat.currency(symbol: '\$');

  return currency.format(amount ??= 0);
}

String parseDateStringToddMMyyyy(String date) {
  return DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
}
