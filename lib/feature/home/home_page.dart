import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../components/components.dart';
import '../../shared/colors.dart';
import '../../shared/page_state.dart';
import '../../utils/service_locator.dart';
import '../../utils/text_utils.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    return buildErrorContent();
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: Lottie.asset(
        'lib/assets/loading_cool.json',
        //width: 100,
        //height: 100,
        fit: BoxFit.fill,
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
        Text('${greeting()} ${homeStore.customer.name}!',
            style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w300)),
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

  Widget buildErrorContent() {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            'lib/assets/error-icon.json',
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              homeStore.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Material(
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () async {
                await homeStore.fetchCustomer();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kNuGreen)),
                padding: EdgeInsets.all(10.0),
                child: Observer(
                  builder: (_) {
                    return Icon(
                      Icons.refresh,
                      size: 80,
                      color: kNuGreen,
                    );
                  },
                ),
              ),
            ),
            color: Colors.transparent,
          ),
        ],
      ),
    ));
  }
}
