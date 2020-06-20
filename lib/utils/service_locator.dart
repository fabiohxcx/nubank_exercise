import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../feature/home/home_store.dart';
import '../feature/product/product_store.dart';
import '../network/client_graphql.dart';
import '../repository/customer_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<GraphQLClient>(ConfigGraphQL.initializeClient());

  locator.registerSingleton<CustomerRepository>(CustomerRepositoryImpl(locator()));

  locator.registerSingleton<HomeStore>(HomeStore(repository: locator()));
  
  locator.registerFactory<ProductStore>(() => ProductStore(repository: locator()));
}
