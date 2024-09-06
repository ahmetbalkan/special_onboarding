/*
   This onboarding widget was created by Ahmet Balkan.
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special_onboarding/src/models/onboarding_page_data.dart';
import 'package:special_onboarding/src/shapes/up_down_arrow_shape.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class SpecialOnboarding extends ConsumerStatefulWidget {
  // A list of onboarding pages to be displayed. Each page includes an image, title, description, and gradient.
  final List<OnboardingPageData> pages;

  // The logo widget to be displayed at the top of each page. This can be an image, icon, or custom widget.
  final Widget logo;

  // Padding around the logo to control the space between the logo and the rest of the content.
  final EdgeInsetsGeometry logoPadding;

  // The background color of the progress indicator (the unfilled portion).
  final Color indicatorBackgroundColor;

  // The overall background color of the onboarding screen.
  final Color backgroundColor;

  // The background color for the upper button (usually the "back" button).
  final Color upperButtonColor;

  // The color of the icon inside the upper button (back arrow).
  final Color upperButtonIconColor;

  // The background color for the lower button (usually the "next" or "finish" button).
  final Color lowerButtonColor;

  // The color of the icon inside the lower button (forward arrow or checkmark).
  final Color lowerButtonIconColor;

  // The text style for the title on each page. This includes font size, weight, color, etc.
  final TextStyle titleTextStyle;

  // The text style for the description on each page. This includes font size, color, etc.
  final TextStyle descriptionTextStyle;

  // The height of the progress indicator, allowing control over how thick or thin it appears.
  final double progressHeight;

  // The border radius of the progress indicator, controlling how rounded its corners appear.
  final BorderRadius progressRadius;

  // Controls whether swipe gestures (left and right) are enabled for page transitions.
  final bool isSwipeEnabled;

  // A callback function that runs whenever the user changes the page. The function receives the current page index as a parameter.
  final Function(int)? onPageChanged;

  // A required callback function that runs when the user reaches the last page of the onboarding flow.
  final Function onLastPageReached;

  const SpecialOnboarding({
    super.key,
    required this.pages, // Required: A list of onboarding pages.
    required this.logo, // Required: A logo widget to display at the top.
    this.logoPadding = const EdgeInsets.all(
        20), // Optional: Padding around the logo, default is 20 on all sides.
    this.indicatorBackgroundColor = Colors
        .blue, // Optional: Background color for the progress indicator, default is blue.
    this.backgroundColor = Colors
        .blue, // Optional: Background color for the entire screen, default is blue.
    this.upperButtonColor = Colors
        .blue, // Optional: Background color for the upper button, default is blue.
    this.upperButtonIconColor = Colors
        .white, // Optional: Color for the icon inside the upper button, default is white.
    this.lowerButtonColor = Colors
        .blue, // Optional: Background color for the lower button, default is blue.
    this.lowerButtonIconColor = Colors
        .white, // Optional: Color for the icon inside the lower button, default is white.
    this.titleTextStyle = const TextStyle(
      fontSize: 24, // Optional: Font size for the title, default is 24.
      fontWeight: FontWeight
          .bold, // Optional: Font weight for the title, default is bold.
      color:
          Colors.white, // Optional: Font color for the title, default is white.
    ),
    this.descriptionTextStyle = const TextStyle(
      fontSize: 16, // Optional: Font size for the description, default is 16.
      color: Colors
          .white, // Optional: Font color for the description, default is white.
    ),
    this.progressHeight =
        10.0, // Optional: Height of the progress bar, default is 10.
    this.progressRadius = const BorderRadius.all(Radius.circular(
        20)), // Optional: Border radius of the progress bar, default is 20.
    this.isSwipeEnabled =
        false, // Optional: Swipe gesture is disabled by default.
    this.onPageChanged, // Optional: Function to call whenever the page changes.
    required this.onLastPageReached, // Required: Function to call when the last page is reached.
  });

  @override
  SpecialOnboardingState createState() => SpecialOnboardingState();
}

class SpecialOnboardingState extends ConsumerState<SpecialOnboarding> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: [
            // PageView to display the onboarding pages. Swipe gestures are enabled or disabled based on the isSwipeEnabled flag.
            PageView.builder(
              controller: _pageController,
              // isSwipeEnabled controls whether the pages can be swiped.
              physics: widget.isSwipeEnabled
                  ? const BouncingScrollPhysics() // Swipe is enabled.
                  : const NeverScrollableScrollPhysics(), // Swipe is disabled.
              onPageChanged: (index) {
                // Call the onPageChanged function (if provided) whenever the page changes.
                if (widget.onPageChanged != null) {
                  widget.onPageChanged!(index);
                }

                // Call the onLastPageReached function when the last page is reached.
                if (index == widget.pages.length - 1) {
                  widget.onLastPageReached();
                }

                ref.read(currentIndexProvider.notifier).state = index;
              },
              itemCount: widget.pages.length,
              itemBuilder: (context, index) {
                final isLastPage = index == widget.pages.length - 1;
                return buildOnboardingPage(widget.pages[index], isLastPage);
              },
            ),
            // Progress indicator at the bottom of the screen. The color changes based on the current page's gradient.
            Positioned(
              bottom: 70,
              left: 50,
              right: 200,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: widget.progressRadius,
                      child: LinearProgressIndicator(
                        value: (currentIndex + 1) / widget.pages.length,
                        backgroundColor: widget.indicatorBackgroundColor,
                        color: widget.pages[currentIndex].gradient.colors.first,
                        minHeight: widget.progressHeight,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            widget.pages[currentIndex].gradient.colors.first),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Logo positioned at the top with custom padding.
            Positioned(
              top: 20,
              left: 30,
              right: 0,
              child: Padding(
                padding: widget.logoPadding,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: widget.logo,
                ),
              ),
            ),
            // Back button, only visible if the user is not on the first page.
            if (currentIndex > 0)
              Positioned(
                top: 48,
                left: 55,
                child: buildCustomIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    if (currentIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  color: widget.upperButtonColor,
                  iconColor: widget.upperButtonIconColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(OnboardingPageData pageData, bool isLastPage) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipPath(
        clipper: UpDownArrowShape(),
        child: Stack(
          children: [
            // Display the image as the background for each page.
            Positioned.fill(
              child: Image.asset(
                pageData.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Apply a gradient overlay on top of the image.
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: pageData.gradient,
                ),
              ),
            ),
            // Display the title and description of the page.
            Positioned(
              bottom: 150,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pageData.title,
                    style: widget.titleTextStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pageData.description,
                    style: widget.descriptionTextStyle,
                  ),
                ],
              ),
            ),
            // Show the forward button (arrow) or checkmark if it's the last page.
            if (!isLastPage)
              Positioned(
                bottom: 30,
                right: 35,
                child: buildCustomIconButton(
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  color: widget.lowerButtonColor,
                  iconColor: widget.lowerButtonIconColor,
                ),
              ),
            if (isLastPage)
              Positioned(
                bottom: 30,
                right: 40,
                child: buildCustomIconButton(
                  icon: Icons.check,
                  onPressed: () {
                    // Action to perform when the last page is reached.
                    widget.onLastPageReached();
                  },
                  color: widget.lowerButtonColor,
                  iconColor: widget.lowerButtonIconColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required Color iconColor,
  }) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
