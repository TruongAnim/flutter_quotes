import 'package:flutter/material.dart';
import 'package:flutter_quotes/pages/landing_page.dart';
import 'package:flutter/rendering.dart';

import 'utils/data.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
