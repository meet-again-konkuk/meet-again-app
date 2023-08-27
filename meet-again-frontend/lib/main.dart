import 'package:flutter/material.dart';
import 'package:meet_again_frontend/screens/home_screen2.dart';
import 'package:meet_again_frontend/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeScreens(),
    );
  }
}
