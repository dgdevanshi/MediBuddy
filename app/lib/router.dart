import 'package:flutter/material.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/registration/client-registration.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(),
      );
    case ClientRegistration.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ClientRegistration(),
      );
    case SellerRegistration.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SellerRegistration(),
      );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
