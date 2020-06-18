import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String errorRoute;

  const NotFoundPage({Key key, this.errorRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page *$errorRoute* not found'),
    );
  }
}
