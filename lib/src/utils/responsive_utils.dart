import 'package:flutter/material.dart';

/// Utility class for responsive design helpers
class ResponsiveUtils {
  /// Breakpoint for mobile devices (screens smaller than 600px)
  static const double mobileBreakpoint = 600;

  /// Breakpoint for tablet devices (screens between 600px and 1024px)
  static const double tabletBreakpoint = 1024;

  /// Check if the current screen is mobile size
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Check if the current screen is tablet size
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  /// Check if the current screen is desktop size
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  /// Get responsive horizontal padding (16px for mobile, 80px for desktop)
  static double getHorizontalPadding(BuildContext context) =>
      isMobile(context) ? 16 : 80;

  /// Get responsive vertical padding with custom values for mobile and desktop
  static double getVerticalPadding(
    BuildContext context, {
    double mobile = 40,
    double desktop = 80,
  }) =>
      isMobile(context) ? mobile : desktop;

  /// Get responsive font size with custom values for mobile and desktop
  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double desktop,
  }) =>
      isMobile(context) ? mobile : desktop;
}
