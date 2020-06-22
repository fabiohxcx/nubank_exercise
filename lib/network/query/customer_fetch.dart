class CustomerFetch {
  static String fetchCustomer = """
  query {
    viewer {
      id
      name
      balance
      offers {
        id
        price
        product {
          id
          name
          description
          image
        }
      }
    }
  }
  """;
}
