class CustomerPurchase {
  static String purchase(String id) {
    return """
  mutation {
    purchase (offerId: \"$id\") {
        success
        errorMessage
        customer {
            id
            name
            balance
        }
    }
  }
  """;
  }
}
