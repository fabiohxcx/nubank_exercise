import 'package:mockito/mockito.dart';
import 'package:nuconta_marketplace/network/failures.dart';
import 'package:nuconta_marketplace/model/purchase_response.dart';
import 'package:nuconta_marketplace/model/customer.dart';
import 'package:dartz/dartz.dart';
import 'package:nuconta_marketplace/repository/customer_repository.dart';

class CustomerRepositoryFake extends Fake implements CustomerRepository {
  @override
  Future<Either<RequestFail, Customer>> fetchCustomer({String id}) async {
    var map = {
      "data": {
        "viewer": {
          "id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab",
          "name": "Jerry Smith",
          "balance": 1000000,
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

  @override
  Future<Either<RequestFail, PurchaseResponse>> purchase(
      {String offerId}) async {
    var map = {
      "data": {
        "purchase": {
          "success": true,
          "errorMessage": null,
          "customer": {
            "id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab",
            "name": "Jerry Smith"
          }
        }
      }
    };
    var response = PurchaseResponse.fromJson(map['data']);

    return Right(response);
  }
}
