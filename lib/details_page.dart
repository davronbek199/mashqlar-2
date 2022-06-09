import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            color: Colors.red,
            width: 400,
            height: 400,
            child: Center(
                child: Text(
              "Details Page",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ))),
      ),
    );
  }


}
