enum TypeFail { NETWORK, SERVER, BAD_FORMAT, BALANCE}

class RequestFail {
  final TypeFail type;
  final String message;

  RequestFail({this.type, this.message});
}
