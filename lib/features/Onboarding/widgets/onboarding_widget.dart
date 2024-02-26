import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;

import '../models/onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF14181B),
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
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
                  padding: const EdgeInsets.only(bottom: 200.0),
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
                      activeDotColor: Theme.of(context).primaryColor,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    '#TeamLarusa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage({required String imageUrl, required String title, required String subtitle}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: const Color(0xFF14181B),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0x990F1113),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logos/CampusCrave_Logo_Vertical_Main_White.svg',
              height: 120, // Slightly bigger logo
              width: 120,
              color: Colors.white, // White logo
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 32, // Bigger title
                fontWeight: FontWeight.bold, // Bold title
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 16, // Slightly bigger subtitle
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('Home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
