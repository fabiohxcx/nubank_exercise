import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/components/card_account.dart';
import 'package:nuconta_marketplace/feature/home/home_store.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';

import '../repository/customer_repository_fake.dart';

main() {
  setUpAll(() {
    var repositoryMock = CustomerRepositoryFake();
    locator.registerSingleton<HomeStore>(HomeStore(repository: repositoryMock));
  });

  Future<void> pumpBalanceCard(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CardAccount()));
  }

  testWidgets('testing important informations', (tester) async {
    await pumpBalanceCard(tester);

    final visibilityButton = find.bySemanticsLabel('balance visibility buttom');
    expect(visibilityButton, findsOneWidget);

    final accountText = find.text('Account');
    expect(accountText, findsOneWidget);

    final visiIcon = find.byIcon(Icons.visibility_off);
    expect(visiIcon, findsOneWidget);

    final balanceAvailableText = find.text('Account');
    expect(balanceAvailableText, findsOneWidget);

    final historyText = find.text('VIEW TRANSACTION HISTORY');
    expect(historyText, findsOneWidget);

    final balanceText = find.text('\$1,000,000.00');
    expect(balanceText, findsOneWidget);
  });

  testWidgets('test on taps', (tester) async {
    await pumpBalanceCard(tester);

    var store = locator<HomeStore>();

    expect(store.balanceVisibility, true);

    await tester.tap(find.byIcon(Icons.visibility_off));

    expect(store.balanceVisibility, false);

    await tester.pump();

    final visiIconOn = find.byIcon(Icons.visibility);
    expect(visiIconOn, findsOneWidget);
  });
}
