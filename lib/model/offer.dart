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
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
