import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/feature/product/product_store.dart';
import 'package:nuconta_marketplace/model/offer.dart';
import 'package:nuconta_marketplace/shared/colors.dart';
import 'package:nuconta_marketplace/utils/service_locator.dart';

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
        title: Text('Product ${offer.product.name}'),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            offer.product.image,
          ),
          Center(
            child: Text(
              'Product ${offer.product.name} Price: \$ ${offer.price}',
            ),
          ),
          Text('Description: ${offer.product.description}'),
          OutlineButton(
            borderSide: BorderSide(color: kNuGreen),
            highlightedBorderColor: kNuGreen,
            color: kNuGreen,
            onPressed: () {
              productStore.purchaseProduct(offer.id);
            },
            child: Text(
              'PURCHASE',
              style: TextStyle(color: kNuGreen, fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
