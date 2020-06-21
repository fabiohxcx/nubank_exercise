import 'offer.dart';

class Customer {
  String id;
  String name;
  int balance;
  List<Offer> offers;

  Customer({this.id, this.name, this.balance, this.offers});

  Customer.fromJson(json) {
    if (json == null) return;

    id = json['id'] ??= "";
    name = json['name'] ??= "";
    balance = json['balance'] ??= 0;
    if (json['offers'] != null) {
      offers = List<Offer>();
      json['offers'].forEach((v) {
        offers.add(Offer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['balance'] = balance;
    if (offers != null) {
      data['offers'] = offers.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
