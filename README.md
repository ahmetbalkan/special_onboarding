# Special Onboarding Module

This onboarding widget was created by **Ahmet Balkan**.

This module provides an onboarding flow for Flutter applications with customizable pages, logos, and swipe controls. The onboarding flow supports swiping between pages, and it is highly configurable. Additionally, we utilize an **import barrel** pattern to simplify imports and improve code structure.

## Features

- **Customizable Onboarding Pages**: Easily create onboarding pages with an image, title, description, and gradient background.
- **Logo Support**: Add a custom logo at the top of the onboarding flow.
- **Progress Indicator**: A customizable progress indicator at the bottom of the screen.
- **Swipe Support**: Control whether users can swipe between pages or not.
- **Easy Importing with Import Barrel**: Simplifies import statements using a barrel file for better project management.

## Usage

### Step 1: Create Onboarding Pages

Define your onboarding pages using the OnboardingPageData model. This model requires an image, title, description, and gradient for each page.

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
      imagePath: 'assets/images/onboarding1.png',
      title: 'Welcome',
      description: 'Discover the features.',
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.green],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    OnboardingPageData(
      imagePath: 'assets/images/onboarding2.png',
      title: 'Stay Connected',
      description: 'Stay in touch with friends.',
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.orange],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
  ],
  logo: Image.asset('assets/logo.png'),
  onLastPageReached: () {
    // Handle the action when the last page is reached
    print('Last page reached!');
  },
  isSwipeEnabled: true, // Enable swipe between pages
);

