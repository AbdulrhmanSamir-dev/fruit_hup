import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/services/init_get_it.dart';
import 'package:fruit_hup/services/navigation_service.dart';
import 'package:fruit_hup/view_models/basket/basket_bloc.dart';
import 'package:fruit_hup/view_models/products/products_bloc.dart';
import 'package:fruit_hup/views/welcome_screen.dart';

import 'firebase_options.dart';


void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProductsBloc()
            ..add(const LoadRecommendProducts()),
        ),
        BlocProvider(
          create: (context) => BasketBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: getIt<NavigationService>().navigatorKey,

        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),

      ),
    );
  }
}
