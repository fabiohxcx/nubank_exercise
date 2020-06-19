import 'package:mobx/mobx.dart';
import 'package:nuconta_marketplace/feature/home/home_store.dart';
import 'package:nuconta_marketplace/model/purchase_response.dart';
import 'package:nuconta_marketplace/repository/customer_repository.dart';
import 'package:nuconta_marketplace/shared/page_state.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final repository = locator.get<CustomerRepository>();

  @observable
  PageState state;

  @observable
  String errorMessage;



  @action
  Future<void> purchaseProduct(String id) async {
    state = PageState.loading;
    print('fetching customer');
    
    PurchaseResponse response = await repository.purchase(offerId: id);

    var homeStore = locator.get<HomeStore>();

    homeStore.setBalance(response.customer.balance);

    print(response.toJson());

    print('fetching finished');
    state = PageState.loaded;
  }
}
