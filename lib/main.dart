
import 'package:flutter/material.dart';

void main() {
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
  final TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
