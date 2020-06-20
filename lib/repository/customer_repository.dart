import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';

import '../model/customer.dart';
import '../model/purchase_response.dart';
import '../network/data/customer_fetch.dart';
import '../network/data/customer_purchase.dart';
import '../network/failures.dart';

abstract class CustomerRepository {
  Future<Either<RequestFail, Customer>> fetchCustomer({String id});
  Future<Either<RequestFail, PurchaseResponse>> purchase({String offerId});
}

class CustomerRepositoryImpl implements CustomerRepository {
  
  final GraphQLClient _client;

  CustomerRepositoryImpl(this._client);

  @override
  Future<Either<RequestFail, Customer>> fetchCustomer({String id}) async {
    final options = QueryOptions(
      documentNode: gql(CustomerFetch.fetchCustomer),
    );

    try {
      final result = await _client.query(options);

      if (!result.hasException) {
        var customer = Customer.fromJson(result.data['viewer']);

        return Right(customer);
      }

      return Left(
          RequestFail(message: 'Network error: Please check your connection'));
    } on Exception catch (e) {
      return Left(RequestFail(message: e.toString()));
    }
  }

  @override
  Future<Either<RequestFail, PurchaseResponse>> purchase(
      {String offerId}) async {
    final options = MutationOptions(
      documentNode: gql(CustomerPurchase.purchase(offerId)),
    );

    try {
      final result = await _client.mutate(options);

      if (result.hasException) {
        return Left(RequestFail(
            message: 'Network error: Please check your connection'));
      }

      print(result.exception);
      print(result.data.toString());

      var response = PurchaseResponse.fromJson(result.data['purchase']);

      if (response.success) {
        return Right(response);
      }

      return Left(RequestFail(message: response.errorMessage));
    } on Exception catch (e) {
      return Left(RequestFail(message: e.toString()));
    }
  }
}
