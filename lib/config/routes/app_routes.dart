import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:fahrplanauskunft/features/search/presentation/screens/home/home_screen.dart';
import 'package:fahrplanauskunft/features/search/presentation/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return _materialRoute(const HomeScreen());

      case DETAILS_SCREEN:
        return _materialRoute(
            DetailsScreen(startPoint: settings.arguments as StartPoint));

      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
