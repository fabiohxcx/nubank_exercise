import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../repository/customer_repository.dart';
import '../../shared/page_state.dart';
import '../../utils/service_locator.dart';
import '../home/home_store.dart';

part 'product_store.g.dart';

class ProductStore extends _ProductStore with _$ProductStore {
  final CustomerRepository repository;

  ProductStore({@required this.repository}) : super(repository);
}

abstract class _ProductStore with Store {
  final CustomerRepository repository;

  _ProductStore(this.repository);

  @observable
  PageState state;

  @observable
  String errorMessage;

  @computed
  bool get success => errorMessage == null;

  @action
  Future<void> purchaseProduct(String id) async {
    state = PageState.loading;
    print('purchasing');

    final result = await repository.purchase(offerId: id);

    result.fold((failure) {
      state = PageState.error;
      errorMessage = failure.message;
    }, (purchaseResponse) {
      state = PageState.error;
      errorMessage = null;
      state = PageState.loaded;
      var homeStore = locator.get<HomeStore>();
      homeStore.setBalance(purchaseResponse.customer.balance);
    });

    print('purchasing finished');
    state = PageState.loaded;
  }
}
