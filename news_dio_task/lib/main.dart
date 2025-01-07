import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News DIO Task',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsScreen(),
    );
  }
}
