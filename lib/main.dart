import 'package:flutter/material.dart';

import 'tracks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tracks(),
      debugShowCheckedModeBanner: false,
    );
  }
}
