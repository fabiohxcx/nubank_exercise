import 'package:graphql/client.dart';

import '../shared/constants.dart';

class ConfigGraphQL {
  static final HttpLink httpLink = HttpLink(
    uri: GRAPHQL_URL,
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $TOKEN',
  );

  static final Link _link = authLink.concat(httpLink);

  static GraphQLClient initializeClient() {
    var _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
    return _client;
  }
}
