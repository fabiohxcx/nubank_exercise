import 'package:flutter/material.dart';

import 'home_page.dart';

class HomeAnimator extends StatefulWidget {
  @override
  _HomeAnimatorState createState() => _HomeAnimatorState();
}

class _HomeAnimatorState extends State<HomeAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  AnimationController get controller => _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(controller: _controller,);
  }
}
