import 'package:flutter/animation.dart';

class HomeEnterAnimation {
  HomeEnterAnimation(this.controller)
      : logoSize = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.800,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        nameOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.800,
              curve: Curves.easeIn,
            ),
          ),
        ),
        balanceCardScrollerXTranslation = Tween(begin: 70.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.700,
              0.900,
              curve: Curves.ease,
            ),
          ),
        ),
        balanceCardScrollerOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.700,
              0.900,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        offersCardScrollerXTranslation = Tween(begin: 70.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.800,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        offersCardScrollerOpacity =
            Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.800,
            1.000,
            curve: Curves.fastOutSlowIn,
          ),
        ));

  final AnimationController controller;
  final Animation<double> logoSize;
  final Animation<double> nameOpacity;
  final Animation<double> balanceCardScrollerXTranslation;
  final Animation<double> balanceCardScrollerOpacity;
  final Animation<double> offersCardScrollerXTranslation;
  final Animation<double> offersCardScrollerOpacity;
}
