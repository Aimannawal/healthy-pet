import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_pet/models/doctor_model.dart';
import 'package:healty_pet/models/service_model.dart';
import 'package:healty_pet/theme.dart';

var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user,
];
var selectedMenu = 0;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavigationBar(),
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
              _services(),
              SizedBox(height: 20),
              _doctors(),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    selectedItemColor: purpleColor,
    type: BottomNavigationBarType.fixed,
    items:
        menus
            .map(
              (e) =>
                  BottomNavigationBarItem(icon: Icon(e), label: e.toString()),
            )
            .toList(),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Color(0xFFBFBFBF),
  );

  ListView _doctors() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (content, index) => _doctor(doctors[index]),
      separatorBuilder: (content, index) => SizedBox(height: 11),
      itemCount: doctors.length,
    );
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/${doctorModel.image}',
              height: 103,
              width: 88,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 7),
                RichText(
                  text: TextSpan(
                    text: "Service: ${doctorModel.services.join(', ')}",
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    SizedBox(width: 7),
                    Text(
                      '${doctorModel.distance}km',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Color(0xFFACA3A3),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Available for ',
                      style: GoogleFonts.manrope(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/svgs/cat.svg'),
                    SizedBox(width: 10),
                    SvgPicture.asset('assets/svgs/dog.svg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
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
                border:
                    selectedService == index
                        ? Border.all(
                          color: Color(0xFFF1E5E5).withOpacity(.22),
                          width: 2,
                        )
                        : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  Service.all()[index],
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
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: Service.all().length,
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
              // shadows: [
              //   Shadow(
              //     color: greyTextColor,
              //     offset: Offset(0, 1),
              //     blurRadius: 2,
              //   ),
              // ],
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
