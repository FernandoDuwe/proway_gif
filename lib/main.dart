import 'package:flutter/material.dart';
import 'package:proway_gif/screens/home_screen.dart';

void main() {
  runApp(ProwayGif());
}

class ProwayGif extends StatelessWidget {
  const ProwayGif({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
