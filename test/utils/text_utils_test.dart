import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/utils/text_utils.dart';

main() {
  group('Testing greeting', () {
    test('morning tests', () {
      expect(greeting(dateTime: DateTime.parse("2012-02-27 09:00:00Z")),
          'Good Morning');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 10:50:00Z")),
          'Good Morning');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 11:59:00Z")),
          'Good Morning');
    });

    test('afteroon tests', () {
      expect(greeting(dateTime: DateTime.parse("2012-02-27 12:00:00Z")),
          'Good Afternoon');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 13:25:00Z")),
          'Good Afternoon');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 16:00:00Z")),
          'Good Afternoon');
    });

    test('evening tests', () {
      expect(greeting(dateTime: DateTime.parse("2012-02-27 17:10:00Z")),
          'Good Evening');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 21:55:35Z")),
          'Good Evening');
      expect(greeting(dateTime: DateTime.parse("2012-02-27 23:00:00Z")),
          'Good Evening');
    });
    test('null tests', () {
      expect(greeting(dateTime: null) != null, true);
    });
  });

  group('Testing currency format', () {
    test('Testing format', () {
      expect(getCurrencyFormated(120), '\$120.00');
      expect(getCurrencyFormated(10), '\$10.00');
      expect(getCurrencyFormated(33.98), '\$33.98');
    });

    test('Testing negative numbers', () {
      expect(getCurrencyFormated(-120), '-\$120.00');
      expect(getCurrencyFormated(-10), '-\$10.00');
       expect(getCurrencyFormated(-1200.12), '-\$1,200.12');
       expect(getCurrencyFormated(-0), '\$0.00');
    });

    test('Testing decimal separator', () {
      expect(getCurrencyFormated(1200.12), '\$1,200.12');
      expect(getCurrencyFormated(3214), '\$3,214.00');
      expect(getCurrencyFormated(123456.25), '\$123,456.25');
    });

    test('null check test', () {
      expect(getCurrencyFormated(null), '\$0.00');
    });
  });
}
