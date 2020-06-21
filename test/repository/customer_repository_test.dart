import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nuconta_marketplace/model/models.dart';
import 'package:nuconta_marketplace/network/failures.dart';

import 'customer_repository_mock.dart';

main() {
  CustomerRepositoryMock repositoryMock;

  setUpAll(() {
    repositoryMock = CustomerRepositoryMock();
  });

  test('testing fetch customer', () async {
    when(repositoryMock.fetchCustomer())
        .thenAnswer((_) async => fetchCustomerFake(id: ''));

    var result = await repositoryMock.fetchCustomer();
    var customer;

    result.fold((failure) {}, (customerResponse) {
      customer = customerResponse;
    });

    expect(customer.name, 'Fabio Hideki');
    expect(customer.id, 'abc');
    expect(customer.balance, 999);
  });
}

Future<Either<RequestFail, Customer>> fetchCustomerFake({String id}) async {
  var map = {
    "data": {
      "viewer": {
        "id": "abc",
        "name": "Fabio Hideki",
        "balance": 999,
        "offers": [
          {
            "id": "offer/portal-gun",
            "price": 5000,
            "product": {
              "id": "product/portal-gun",
              "name": "Portal Gun",
              "description":
                  "The Portal Gun is a gadget that allows the user(s) to travel between different universes/dimensions/realities.",
              "image":
                  "https://vignette.wikia.nocookie.net/rickandmorty/images/5/55/Portal_gun.png/revision/latest/scale-to-width-down/310?cb=20140509065310"
            }
          },
          {
            "id": "offer/microverse-battery",
            "price": 5507,
            "product": {
              "id": "product/microverse-battery",
              "name": "Microverse Battery",
              "description":
                  "The Microverse Battery contains a miniature universe with a planet inhabited by intelligent life.",
              "image":
                  "https://vignette.wikia.nocookie.net/rickandmorty/images/8/86/Microverse_Battery.png/revision/latest/scale-to-width-down/310?cb=20160910010946"
            }
          },
          {
            "id": "offer/mr-meeseeks-box",
            "price": 999999999,
            "product": {
              "id": "product/mr-meeseeks-box",
              "name": "Mr. Meeseeks Box",
              "description":
                  "The Mr. Meeseeks Box is a gadget that creates a Mr. Meeseeks for the purpose of completing one given objective.",
              "image":
                  "https://vignette.wikia.nocookie.net/rickandmorty/images/f/f7/Mr._Meeseeks_Box.png/revision/latest/scale-to-width-down/310?cb=20160909153718"
            }
          },
          {
            "id": "offer/cognition-amplifier",
            "price": 1000000,
            "product": {
              "id": "product/cognition-amplifier",
              "name": "Cognition Amplifier",
              "description": "The cognition amplifier makes Snuffles smart.",
              "image":
                  "https://vignette.wikia.nocookie.net/rickandmorty/images/2/27/Cognition_Amplifier.png/revision/latest/scale-to-width-down/180?cb=20140604001816"
            }
          }
        ]
      }
    }
  };
  var customer = Customer.fromJson(map['data']['viewer']);

  return Right(customer);
}
