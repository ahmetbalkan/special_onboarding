import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special_onboarding/special_onboarding.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Special Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SpecialOnboarding(
      pages: [
        OnboardingPageData(
          imagePath: 'assets/onboarding/onboarding_slide1.jpg',
          title: 'Welcome to Our App',
          description: 'Discover the new features and services.',
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(1),
              Colors.blue.withOpacity(0.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        OnboardingPageData(
          imagePath: 'assets/onboarding/onboarding_slide2.jpg',
          title: 'Stay Connected',
          description: 'Keep in touch with your friends and family.',
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(1),
              Colors.green.withOpacity(0.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        OnboardingPageData(
          imagePath: 'assets/onboarding/onboarding_slide3.jpg',
          title: 'Get Started Now',
          description: 'Start using our app today.',
          gradient: LinearGradient(
            colors: [
              Colors.orange.withOpacity(1),
              Colors.orange.withOpacity(0.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ],
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      descriptionTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      logo: const Text(
        'Logo',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      backgroundColor: Colors.grey[300]!,
      upperButtonColor: Colors.blue,
      upperButtonIconColor: Colors.white,
      lowerButtonColor: Colors.red,
      lowerButtonIconColor: Colors.white,
      indicatorBackgroundColor: Colors.grey,
      onPageChanged: (index) {
        if (kDebugMode) {
          print('Page changed to: $index');
        }
      },
      onLastPageReached: () {
        if (kDebugMode) {
          print('Last page reached!');
        }
      },
      isSwipeEnabled: false,
    );
  }
}
