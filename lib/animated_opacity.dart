import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:mashqlar2/details_page.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Text("Animated Opacity")),
            SizedBox(
              height: 40,
            ),
            BouncingWidget(
              scaleFactor: 2.5,
              duration: Duration(milliseconds: 100),
              onPressed: () {},
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
