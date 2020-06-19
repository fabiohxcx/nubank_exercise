import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nuconta_marketplace/feature/product/product_store.dart';
import 'package:nuconta_marketplace/model/offer.dart';
import 'package:nuconta_marketplace/shared/colors.dart';
import 'package:nuconta_marketplace/shared/page_state.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';
import 'package:nuconta_marketplace/utils/text_utils.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String id = 'product_detail_page';
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final productStore = locator.get<ProductStore>();

  @override
  Widget build(BuildContext context) {
    Offer offer = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${offer.product.name}', style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                ),),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: double.infinity,
                              decoration: new BoxDecoration(
                                color: Colors.white.withOpacity(0.0),
                                border: Border.all(color: kNuPurple8A05BE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Image.network(
                                offer.product.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Text(
                            '${offer.product.name}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: kPrimaryColor),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Text(
                            '${getCurrencyFormated(offer.price)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: kNuOrange),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${offer.product.description}',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Container(
                            width: double.infinity,
                            child: OutlineButton(
                              borderSide: BorderSide(color: kNuGreen),
                              highlightedBorderColor: kNuGreen,
                              color: kNuGreen,
                              onPressed: () {
                                productStore.purchaseProduct(offer.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'PURCHASE',
                                  style: TextStyle(
                                      color: kNuGreen,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Observer(builder: (_) {
            return productStore.state == PageState.loading
                ? _showLoader()
                : Container();
          })
        ],
      ),
    );
  }

  Widget _showLoader() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 10,
          sigmaX: 10,
        ),
        child: Container(
          color: Colors.white.withOpacity(0.6),
          child: Center(
              child: Container(
                  height: 100, width: 100, child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
