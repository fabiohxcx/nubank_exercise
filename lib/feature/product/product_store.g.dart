// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$stateAtom = Atom(name: '_ProductStore.state');

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

  final _$purchaseProductAsyncAction =
      AsyncAction('_ProductStore.purchaseProduct');

  @override
  Future<void> purchaseProduct(String id) {
    return _$purchaseProductAsyncAction.run(() => super.purchaseProduct(id));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
