import 'package:flutter/material.dart';
import 'package:fruit_hup/views/home_screen.dart';
import 'package:fruit_hup/widgets/custom_button.dart';
import 'package:fruit_hup/widgets/custom_text_form_field.dart';

import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';
import '../services/user_service.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String? clientName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'What is your firstname?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff27214D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFormField(
                        onChanged: (data) {
                          clientName = data;
                        },
                        hintText: 'First Name',
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onTap: () {
                          if (clientName == null ||
                              clientName!.trim().isEmpty) {
                            getIt<NavigationService>().showSnackBar(
                              'Please enter your name to continue',
                            );
                            return;
                          }
                          getIt<UserService>().clientName = clientName!.trim();

                          getIt<NavigationService>().navigateReplace(
                             HomeScreen(clientName: clientName!.trim(),),
                          );
                        },
                        buttonName: "Start Ordering",
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
