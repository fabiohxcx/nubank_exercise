import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';
import 'package:nuconta_marketplace/network/failures.dart';

import '../model/customer.dart';
import '../model/purchase_response.dart';
import '../network/client_graphql.dart';
import '../network/data/customer_fetch.dart';
import '../network/data/customer_purchase.dart';

class CustomerRepository {
  var _client = ConfigGraphQL.initializeClient();

  Future<Either<RequestFail, Customer>> fetchCustomer({String id}) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(CustomerFetch.fetchCustomer),
    );

    try {
      final QueryResult result = await _client.query(options);

      if (!result.hasException) {
        Customer customer = Customer.fromJson(result.data['viewer']);

        return Right(customer);
      }

      return Left(
          RequestFail(message: 'Network error: Please check your connection'));
    } on Exception catch (e) {
      return Left(RequestFail(message: e.toString()));
    }
  }

  Future<Either<RequestFail, PurchaseResponse>> purchase(
      {String offerId}) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(CustomerPurchase.purchase(offerId)),
    );

    try {
      final QueryResult result = await _client.mutate(options);

      if (result.hasException) {
        return Left(RequestFail(
            message: 'Network error: Please check your connection'));
      }

      print(result.exception);
      print(result.data.toString());

      PurchaseResponse response =
          PurchaseResponse.fromJson(result.data['purchase']);

      if (response.success) {
        return Right(response);
      }
      return Left(RequestFail(message: response.errorMessage));
    } on Exception catch (e) {

      return Left(RequestFail(message: e.toString()));
      
    }
  }
}
