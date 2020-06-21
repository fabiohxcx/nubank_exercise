import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/model/customer.dart';

main() {
  group('test input data from Json: ', () {
    test('null data', () {
      final customer = Customer.fromJson(null);
      expect(customer, isInstanceOf<Customer>());
    });

    test('check all properties', () {
      final json = {
        'id': '123',
        'name': 'Fabio Hideki',
        'balance': 123,
        'offers': null
      };
      final customer = Customer.fromJson(json);

      expect(customer.id, json['id']);
      expect(customer.name, json['name']);
      expect(customer.balance, json['balance']);
      expect(customer.offers, json['offers']);
    });

    test('check empty map', () {
      final json = {};
      final customer = Customer.fromJson(json);

      expect(customer.id, '');
      expect(customer.name, '');
      expect(customer.balance, 0);
      expect(customer.offers, null);
    });

    test('check to String', () {
      final json = {
        'id': '123',
        'name': 'Fabio Hideki',
        'balance': 123,
      };
      final customer = Customer.fromJson(json);

      expect(customer.toString(), json.toString());
    });
  });

  group('test input data from Map: ', () {
    test('toJson test', () {
      var customer = Customer(id: 'myId', name: 'myName', balance: 456);

      expect(
          customer.toJson(), {'id': 'myId', 'name': 'myName', 'balance': 456});
    });
  });
}
