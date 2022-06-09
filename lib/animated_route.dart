import 'package:flutter/material.dart';

import 'details_page.dart';

class AnimatedRoutePage extends StatefulWidget {
  const AnimatedRoutePage({Key? key}) : super(key: key);

  @override
  State<AnimatedRoutePage> createState() => _AnimatedRoutePageState();
}

class _AnimatedRoutePageState extends State<AnimatedRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.of(context).push(
              _creatRoute()   );
        }, child: Text("Animated Route"),),
      ),
    );
  }
  Route _creatRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 800),
        reverseTransitionDuration: Duration(milliseconds: 800),
    );
  }
}
