import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_pet/theme.dart';
import 'package:healty_pet/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 42),
                    Image.asset('assets/images/logo.png', height: 22),
                    const SizedBox(height: 73),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Helping you\nto keep ',
                        style: GoogleFonts.manrope(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: whiteColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'your bestie',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: white,
                            ),
                          ),
                          TextSpan(
                            text: '\nstay healthy',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
