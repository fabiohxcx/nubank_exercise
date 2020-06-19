import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nuconta_marketplace/feature/home/home_store.dart';
import 'package:nuconta_marketplace/shared/colors.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';
import 'package:nuconta_marketplace/utils/text_utils.dart';

class CardAccount extends StatelessWidget {
  final homeStore = locator.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(2.0)),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/ic_savings.png'),
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Gotham',
                              color: kNuPurple8E8390,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Balance available',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: kNuPurple8E8390,
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          '${getCurrencyFormated(homeStore.balance)}',
                          style: TextStyle(
                              fontFamily: "Gotham",
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: kNuBlue),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(2.0)),
                color: kNuGrayEDEDED,
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              width: double.infinity,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'VIEW TRANSACTION HISTORY',
                            style: TextStyle(color: kNuGreen, fontSize: 10),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: kNuGreen,
                          )
                        ],
                      )),
                  onTap: () {
                    print('dsadsa');
                  },
                ),
              ),
            )
          ],
        ),
        Positioned(
          top: 30.0,
          right: 30.0,
          child: Material(
            child: new InkWell(
              customBorder: new CircleBorder(),
              onTap: homeStore.tooglebalanceVisibility,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Observer(
                  builder: (_) {
                    return Icon(
                      homeStore.balanceVisibility
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kNuPurple8E8390,
                    );
                  },
                ),
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
