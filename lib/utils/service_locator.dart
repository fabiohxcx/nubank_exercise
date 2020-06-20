import 'package:get_it/get_it.dart';

import '../feature/home/home_store.dart';
import '../repository/customer_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<CustomerRepository>(CustomerRepository());
  locator.registerSingleton<HomeStore>(HomeStore());
  //locator.registerSingleton<ProductStore>(ProductStore());
}
