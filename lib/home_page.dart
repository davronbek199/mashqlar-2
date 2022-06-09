import 'package:flutter/material.dart';
import 'package:mashqlar2/animated_opacity.dart';
import 'package:mashqlar2/animated_route.dart';
import 'package:mashqlar2/change_lang_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AnimatedOpacityPage()));
                },
                child: Text("Animated Opacity")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimatedRoutePage()));
            }, child: Text("Animated Route")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeLangBottom()));
            }, child: Text("Change lang bottom"))
          ],
        ),
      ),
    );
  }
}
