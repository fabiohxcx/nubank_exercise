import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: repository.fetchCustomer(id: "id"),
                builder: (context, projectSnap) {
                  if (!projectSnap.hasData) {
                    return Text(
                      'Loading',
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  } else {
                    Customer customer = projectSnap.data;

                    return Text(
                      '${customer.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  }
                }),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
