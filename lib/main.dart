import 'package:flutter/material.dart';
import 'package:fruit_hup/services/init_get_it.dart';
import 'package:fruit_hup/services/navigation_service.dart';
import 'package:fruit_hup/views/welcome_screen.dart';


void main() {
  setupLocator();

  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,

      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),

    );
  }
}
