import 'product.dart';

class Offer {
  String id;
  int price;
  Product product;

  Offer({this.id, this.price, this.product});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = id;
    data['price'] = price;
    if (product != null) {
      data['product'] = product.toJson();
    }
    return data;
  }
}
