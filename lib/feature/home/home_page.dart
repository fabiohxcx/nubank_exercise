import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nuconta_marketplace/components/components.dart';
import 'package:nuconta_marketplace/feature/home/home_store.dart';
import 'package:nuconta_marketplace/repository/customer_repository.dart';
import 'package:nuconta_marketplace/shared/colors.dart';
import 'package:nuconta_marketplace/shared/page_state.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = CustomerRepository();
  final homeStore = locator.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kPrimaryColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Observer(
              builder: (_) {
                switch (homeStore.state) {
                  case PageState.initial:
                    return buildLoading();
                  case PageState.loading:
                    return buildLoading();
                  case PageState.loaded:
                    return buildContent();
                  case PageState.error:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Column buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('lib/assets/ic_nu_logo.png'),
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Conta',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        Text('Hello ${homeStore.customer.name}!',
            style: TextStyle(
                fontFamily: 'Gotham', fontSize: 16, color: Colors.white)),
        Expanded(
          child: Scrollbar(
            child: ListView(
              children: <Widget>[
                CardAccount(),
                CardOffers(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
