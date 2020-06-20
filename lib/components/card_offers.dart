import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../feature/home/home_store.dart';
import '../feature/product/product_detail_page.dart';
import '../model/models.dart';
import '../shared/colors.dart';
import '../utils/service_locator.dart';
import '../utils/text_utils.dart';

class CardOffers extends StatelessWidget {
  final homeStore = locator.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.local_offer,
                color: kNuPurple8E8390,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Offers',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gotham',
                    color: kNuPurple8E8390,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 15,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: homeStore.customer.offers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemBuilder: (context, index) {
                return getOfferCard(
                    offer: homeStore.customer.offers[index], context: context);
              })
        ],
      ),
    );
  }
}

Widget getOfferCard({Offer offer, BuildContext context}) {
  return Semantics(
    button: true,
    label: 'Offer ${offer.product.name}',
      child: Container(
      height: 170,
      width: 150,
      decoration: BoxDecoration(
        //border: Border.all(color: kNuPurple8A05BE),
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          fit: BoxFit.cover,
          image: NetworkImage(offer.product.image),
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print(offer.product.name);

            Navigator.pushNamed(
              context,
              ProductDetailsPage.id,
              arguments: offer,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                  border: Border.all(color: kNuPurple8A05BE),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(offer.product.image),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: kNuPurple8A05BE,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('${getCurrencyFormated(offer.price)}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      offer.product.name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: kNuOrange,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
