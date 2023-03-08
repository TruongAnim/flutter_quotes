import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 10,
            ),
            Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              height: 100,
              child: Text("hello"),
            )
          ],
        ),
      ),
    );
  }
}
