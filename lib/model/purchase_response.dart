import 'customer.dart';

class PurchaseResponse {
  bool success;
  String errorMessage;
  Customer customer;

  PurchaseResponse({this.success, this.errorMessage, this.customer});

  PurchaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMessage = json['errorMessage'] ??= '';
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var data =  Map<String, dynamic>();
    data['success'] = success;
    data['errorMessage'] = errorMessage;
    if (customer != null) {
      data['customer'] = customer.toJson();
    }
    return data;
  }
}
