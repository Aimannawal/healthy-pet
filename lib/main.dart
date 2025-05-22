import 'package:flutter/material.dart';
import 'package:healty_pet/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: Colors.white, 
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
