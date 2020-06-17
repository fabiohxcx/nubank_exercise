import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuconta_marketplace/feature/home/home_page.dart';
import 'package:nuconta_marketplace/feature/product/product_detail_page.dart';

import 'shared/colors.dart';
import 'shared/theme.dart';
import 'utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(NuContaApp());
}

class NuContaApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryDarkColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuConta MarketPlace',
      theme: appTheme,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (_) => HomePage(),
        ProductDetailsPage.id: (_) => ProductDetailsPage(),
      }
    );
  }
}
