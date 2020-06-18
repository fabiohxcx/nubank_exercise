import 'package:graphql/client.dart';


import '../model/customer.dart';
import '../model/purchase_response.dart';
import '../network/client_graphql.dart';
import '../network/data/customer_fetch.dart';
import '../network/data/customer_purchase.dart';

class CustomerRepository {
  var _client = ConfigGraphQL.initializeClient();

  Future<Customer> fetchCustomer({String id}) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(CustomerFetch.fetchCustomer),
    );

    try {
      final QueryResult result = await _client.query(options);

      Customer customer = Customer.fromJson(result.data['viewer']);

      return customer;
    } catch (e) {
      throw e;
    }
  }

  Future<PurchaseResponse> purchase({String offerId}) async {
    
    final MutationOptions options = MutationOptions(
      documentNode: gql(CustomerPurchase.purchase(offerId)),
    );


    try {
      final QueryResult result = await _client.mutate(options);

      print(result.exception);
      print(result.data.toString());

      PurchaseResponse response = PurchaseResponse.fromJson(result.data['purchase']);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
