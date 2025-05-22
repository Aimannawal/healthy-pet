import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_pet/theme.dart';

var services = ['Vaccine', 'Surgery', 'SPA & Treatment', 'Consultation'];
var selectedService = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              _greetings(),
              SizedBox(height: 16),
              _card(),
              SizedBox(height: 20),
              _search(),
              SizedBox(height: 20),
              SizedBox(
                height: 36,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:
                              selectedService == index
                                  ? const Color(0xFF818AF9)
                                  : const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            services[index],
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color:
                                  selectedService == index
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF3F3E3F).withOpacity(.3),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 10),
                  itemCount: services.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: greyBackgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(FeatherIcons.search, color: Color(0xFFADACAD)),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: GoogleFonts.manrope(
            fontSize: 12,
            color: greyTextColor,
            fontWeight: FontWeight.w700,
            height: 150 / 100,
          ),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: purpleColor,
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/card.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Your ',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        letterSpacing: 3.5 / 100,
                        height: 150 / 100,
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Catrine ',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                            color: white,
                          ),
                        ),
                        TextSpan(
                          text: 'will get \nvacination ',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            color: whiteColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Tommorow \nat 07.00 AM!',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w800,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      border: Border.all(
                        color: Colors.white.withOpacity(.12),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'See details',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Human!',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: blackColor,
              shadows: [
                Shadow(
                  color: greyTextColor,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.shoppingBag,
                  color: purpleColor,
                  size: 28,
                ),
              ),
              Positioned(
                right: 7,
                top: 7,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(15 / 2),
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: GoogleFonts.mPlus1p(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
