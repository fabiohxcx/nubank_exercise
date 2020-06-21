import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  var counter = 0;

  takeScreenshot(FlutterDriver driver, String name) async {
    final pixels = await driver.screenshot();
    final file = File('screenshots/${counter++}_$name.png');
    await file.writeAsBytes(pixels);
    print(file.path);
  }

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
    Directory('screenshots').create();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('check flutter driver health', () async {
    var health = await driver.checkHealth();
    print(health.status);
  });

  test(('balance visibility test'), () async {
    await driver.runUnsynchronized(() async {
      takeScreenshot(driver, 'loading');
      await driver.waitFor(find.byValueKey('visibility_balance'));
      await takeScreenshot(driver, 'loaded');
      await driver.waitFor(find.text('\$1,000,000.00'));
      await driver.tap(find.byValueKey('visibility_balance'));
      await takeScreenshot(driver, 'balance_invisible');
    });
  });

  test(('navigation test Portal Gun'), () async {
    await driver.runUnsynchronized(() async {
      await driver.tap(find.byValueKey('Portal Gun'));
      await driver.waitFor(find.text('Product Portal Gun'));
      await takeScreenshot(driver, 'ProductPortalGun');

      await driver.tap(find.text('PURCHASE'));

      await driver.waitFor(find.text('Success'));

      await takeScreenshot(driver, 'Success');
      await driver.tap(find.text('CLOSE'));
    });
  });

  test(('navigation test Microverse Battery'), () async {
    await driver.runUnsynchronized(() async {
      await driver.tap(find.byValueKey('Microverse Battery'));
      await driver.waitFor(find.text('Product Microverse Battery'));
      await takeScreenshot(driver, 'MicroverseBattery');

      await driver.tap(find.text('PURCHASE'));

      await driver.waitFor(find.text('Offer expired'));
      await takeScreenshot(driver, 'Offerexpired');

      await driver.tap(find.text('CLOSE'));
    });
  });
}
