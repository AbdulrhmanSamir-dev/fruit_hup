import 'package:flutter/material.dart';
import 'package:fruit_hup/views/home_screen.dart';
import 'package:fruit_hup/views/track_order_screen.dart';
import 'package:fruit_hup/widgets/animated_success_icon.dart';
import 'package:fruit_hup/widgets/custom_button.dart';

import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * .06),
          const AnimatedSuccessIcon(),
          SizedBox(height: height * .06),
          const Text(
            'Congratulations!!!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Your order have been taken and is being attended to',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(height: height * .06),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*.3,
            child: CustomButton(
              onTap: (){
                getIt<NavigationService>().navigateReplace(const TrackOrderScreen());

              },
              buttonName: 'Track Order',
              backgroundColor: AppConstants.KmianColor,
              textColor: Colors.white,
            ),
          ),
          SizedBox(height: height * .06),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*.45,
            child: CustomButton(
              onTap: (){
                getIt<NavigationService>().navigateReplace(const HomeScreen());

              },
              buttonName: 'Continue Shopping',
              backgroundColor: Colors.white,
              textColor: AppConstants.KmianColor,
              borderColor: AppConstants.KmianColor,
            ),
          )
        ],
      ),
    );
  }
}
