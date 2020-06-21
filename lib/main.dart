import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature/home/home_animator.dart';
import 'feature/home/home_page.dart';
import 'feature/product/product_detail_page.dart';
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
    var materialApp = MaterialApp(
      //showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      title: 'NuConta MarketPlace',
      theme: appTheme,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (_) => HomeAnimator(),
        ProductDetailsPage.id: (_) => ProductDetailsPage(),
      },
    );
    return materialApp;
  }
}
