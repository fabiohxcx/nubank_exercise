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
    customer = await repository.fetchCustomer(id: '');
    setBalance(customer.balance);
    print(customer.toJson());
    print('fetching finished');
    state = PageState.loaded;
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
