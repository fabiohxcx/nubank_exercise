class CustomerPurchase {
  static String purchase = """
  mutation {
    purchase (offerId: \$id: String!) {
        success
        errorMessage
        customer {
            id
            name
        }
    }
  }
  """;
}
