import 'customer.dart';

class PurchaseResponse {
  bool success;
  Null errorMessage;
  Customer customer;

  PurchaseResponse({this.success, this.errorMessage, this.customer});

  PurchaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMessage = json['errorMessage'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMessage'] = this.errorMessage;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    return data;
  }
}