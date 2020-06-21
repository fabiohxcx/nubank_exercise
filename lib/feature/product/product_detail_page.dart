import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../model/offer.dart';
import '../../shared/colors.dart';
import '../../shared/page_state.dart';
import '../../utils/service_locator.dart';
import '../../utils/text_utils.dart';
import 'product_store.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String id = 'product_detail_page';
  final ProductStore productStore = locator();

  @override
  Widget build(BuildContext context) {
    Offer offer = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product ${offer.product.name}',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        leading: Semantics(
          button: true,
          label: 'back button',
          child: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SafeArea(
              child: Observer(builder: (_) {
          return productStore.state == PageState.loaded
              ? _buildResultBody(context)
              : Stack(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.30,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.0),
                                          border:
                                              Border.all(color: kNuPurple8A05BE),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                        child: Hero(
                                          tag: 'hero-${offer.product.id}',
                                          child: Image.network(
                                            offer.product.image,
                                            fit: BoxFit.cover,
                                            semanticLabel: 'Product\'s Image',
                                          ),
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
                                      color: kNuGreen,
                                      child: OutlineButton(
                                        borderSide: BorderSide(color: kNuGreen),
                                        highlightedBorderColor: kNuGreen,
                                        color: kNuGreen,
                                        onPressed: () {
                                          productStore.purchaseProduct(offer.id);
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 15),
                                          child: Text(
                                            'PURCHASE',
                                            style: TextStyle(
                                                color: Colors.white,
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
                    productStore.state == PageState.loading
                        ? _showLoader()
                        : Container()
                  ],
                );
        }),
      ),
    );
  }

  Widget _buildResultBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          productStore.success
              ? Lottie.asset(
                  'lib/assets/purchase-validated.json',
                  width: 300,
                  repeat: false,
                  fit: BoxFit.fill,
                )
              : Lottie.asset(
                  'lib/assets/error-icon.json',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              productStore.success ? 'Success' : productStore.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: kNuGreen,
            child: OutlineButton(
              borderSide: BorderSide(color: kNuGreen),
              highlightedBorderColor: kNuGreen,
              color: kNuGreen,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
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
              child: Lottie.asset('lib/assets/purchasing.json',
                  width: 150, height: 150)),
        ),
      ),
    );
  }
}
