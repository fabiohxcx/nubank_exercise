import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../model/models.dart';
import '../../repository/customer_repository.dart';
import '../../shared/page_state.dart';
import '../../utils/service_locator.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final repository = locator.get<CustomerRepository>();

  @observable
  Customer customer;

  @observable
  num balance = 0;

  @observable
  PageState state;

  @observable
  String errorMessage;

  @observable
  List<Transaction> transactions = [];

  @observable
  bool balanceVisibility = true;

  _HomeStore() {
    fetchCustomer();
    state = PageState.initial;
  }

  @action
  Future<void> fetchCustomer() async {
    state = PageState.loading;

    print('fetching customer');

    final result =
        await repository.fetchCustomer(id: 'customer_id_after_login');

    result.fold((failure) {
      state = PageState.error;
      errorMessage = failure.message;
    }, (customerResponse) {
      customer = customerResponse;
      setBalance(customer.balance);
      state = PageState.loaded;

      print(customer.toJson());
    });

    print('fetching finished');
  }

  @action
  void setBalance(num value) {
    balance = value;
  }

  @action
  void tooglebalanceVisibility() {
    balanceVisibility = !balanceVisibility;
    print(balanceVisibility);
  }

  @action
  void addTransaction(Product product, num value) {
    transactions.add(Transaction(
        name: product.name,
        value: value,
        date: DateFormat("dd/MM/yyyy").format(DateTime.now())));
  }
}
