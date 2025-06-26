import 'package:flutter/material.dart';
import 'package:fruit_hup/constants/app_constants.dart';
import 'package:fruit_hup/services/init_get_it.dart';
import 'package:fruit_hup/services/navigation_service.dart';
import 'package:fruit_hup/views/authentication_screen.dart';
import 'package:fruit_hup/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppConstants.KmianColor,
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/fruitHupPics/welpic2.jpg'),
                const SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 10),
                  const Text(
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff27214D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff5D577E),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(flex: 20),
                  CustomButton(onTap: () {
                    getIt<NavigationService>().navigateReplace(const AuthenticationScreen());
                  }, buttonName: "Let's Continue"),
                  const Spacer(flex: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
