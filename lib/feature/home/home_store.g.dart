// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$customerAtom = Atom(name: '_HomeStore.customer');

  @override
  Customer get customer {
    _$customerAtom.reportRead();
    return super.customer;
  }

  @override
  set customer(Customer value) {
    _$customerAtom.reportWrite(value, super.customer, () {
      super.customer = value;
    });
  }

  final _$balanceAtom = Atom(name: '_HomeStore.balance');

  @override
  num get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(num value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$stateAtom = Atom(name: '_HomeStore.state');

  @override
  PageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$transactionsAtom = Atom(name: '_HomeStore.transactions');

  @override
  List<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$balanceVisibilityAtom = Atom(name: '_HomeStore.balanceVisibility');

  @override
  bool get balanceVisibility {
    _$balanceVisibilityAtom.reportRead();
    return super.balanceVisibility;
  }

  @override
  set balanceVisibility(bool value) {
    _$balanceVisibilityAtom.reportWrite(value, super.balanceVisibility, () {
      super.balanceVisibility = value;
    });
  }

  final _$fetchCustomerAsyncAction = AsyncAction('_HomeStore.fetchCustomer');

  @override
  Future<void> fetchCustomer() {
    return _$fetchCustomerAsyncAction.run(() => super.fetchCustomer());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setBalance(num value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setBalance');
    try {
      return super.setBalance(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tooglebalanceVisibility() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.tooglebalanceVisibility');
    try {
      return super.tooglebalanceVisibility();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTransaction(Product product, num value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.addTransaction');
    try {
      return super.addTransaction(product, value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customer: ${customer},
balance: ${balance},
state: ${state},
transactions: ${transactions},
balanceVisibility: ${balanceVisibility}
    ''';
  }
}
