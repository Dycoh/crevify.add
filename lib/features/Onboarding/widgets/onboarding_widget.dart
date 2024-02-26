import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import '../models/onboarding_model.dart';
import '../../authentication/screens/login_page.dart'; // Import your LoginPage widget
import '../../authentication/screens/signup_page.dart'; // Import your SignupPage widget

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = OnboardingModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 0, 32, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_1.jpg',
                      title: 'Welcome to Crevify!',
                      subtitle: 'Where Healthy Meets Delicious!',
                    ),
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_2.jpg',
                      title: 'No Time? No Problem!',
                      subtitle: 'Healthy Meals, Delivered Fast!',
                    ),
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_3.jpg',
                      title: 'Eat Well, Live Well!',
                      subtitle: 'Nutritious Meals for Campus Life!',
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: smooth_page_indicator.ExpandingDotsEffect(
                        expansionFactor: 4,
                        spacing: 8,
                        radius: 40,
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: const Color(0xFFD9D9D9),
                        activeDotColor: Color.fromARGB(255, 0, 143, 0),
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height:
                  36), // Adding space between the onboarding content and the button
          ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/login'); // Navigate to the login screen
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 56, vertical: 14),
              backgroundColor:
                  Colors.green[900], // Changing background color to dark green
            ),
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 36), // Adding space between the button and the text
          Text(
            '#TeamLarusa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 40), // Adding additional space at the bottom
        ],
      ),
    );
  }

  Widget _buildPage(
      {required String imageUrl,
      required String title,
      required String subtitle}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
      child: Container(
        color: const Color(0x990F1113),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SvgPicture.asset(
              'assets/logos/CampusCrave_Logo_Vertical_Main_White.svg',
              height: 160,
              width: 160,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
