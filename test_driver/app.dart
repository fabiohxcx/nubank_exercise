import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:nuconta_marketplace/main.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(NuContaApp());
}
