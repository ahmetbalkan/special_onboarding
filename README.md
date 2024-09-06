# Special Onboarding Module

This module provides an onboarding flow for Flutter applications with customizable pages, logos, and swipe controls. The onboarding flow supports swiping between pages, and it is highly configurable. Additionally, we utilize an **import barrel** pattern to simplify imports and improve code structure.

## Features

- **Customizable Onboarding Pages**: Easily create onboarding pages with an image, title, description, and gradient background.
- **Logo Support**: Add a custom logo at the top of the onboarding flow.
- **Progress Indicator**: A customizable progress indicator at the bottom of the screen.
- **Swipe Support**: Control whether users can swipe between pages or not.
- **Easy Importing with Import Barrel**: Simplifies import statements using a barrel file for better project management.

## Installation

To use this package, add `special_onboarding` as a dependency in your `pubspec.yaml` file.

### pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter

  special_onboarding: ^1.0.0


dart
OnboardingPageData(
  imagePath: 'assets/images/onboarding1.png',
  title: 'Welcome to Our App',
  description: 'Discover the new features and services.',
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.green],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ),
);

### Step 2: Add the SpecialOnboarding Widget

Use the `SpecialOnboarding` widget in your project to display the onboarding flow. You can customize the background color, button styles, and more.

```dart
SpecialOnboarding(
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

