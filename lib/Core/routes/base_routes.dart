import 'package:flutter/material.dart';

class BaseRoute extends PageRouteBuilder {
  Widget page;

  BaseRoute(this.page)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              Stack(children: [page]),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget widget) {
            var begin = 0.0;
            var end = 1.0;
            var tween = Tween(begin: begin, end: end);
            var caurvesanimation = CurvedAnimation(
                parent: animation, curve: Curves.linearToEaseOut);

            return ScaleTransition(
              scale: tween.animate(caurvesanimation),
              child: widget,
            );
          },
        );
}
