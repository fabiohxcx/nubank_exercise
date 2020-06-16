import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuconta_marketplace/shared/colors.dart';

import 'model/customer.dart';
import 'repository/customer_repository.dart';
import 'shared/theme.dart';
import 'utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryDarkColor,
    ));
    return MaterialApp(
      title: 'NuConta MarketPlace',
      theme: appTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  VoidCallback refetchQuery;
  CustomerRepository repository = CustomerRepository();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kPrimaryColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('lib/assets/ic_nu_logo.png'),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 8,),
                    Text('Conta', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Gotham', fontWeight: FontWeight.w300),)
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                      future: repository.fetchCustomer(id: "id"),
                      builder: (context, projectSnap) {
                        if (!projectSnap.hasData) {
                          return Text(
                            'Loading',
                            style: Theme.of(context).textTheme.bodyText1,
                          );
                        } else {
                          Customer customer = projectSnap.data;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                '${customer.name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Gotham',
                                    fontSize: 18),
                              ),
                              Text(
                                '$_counter',
                                style: TextStyle(fontFamily: 'Gotham'),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
