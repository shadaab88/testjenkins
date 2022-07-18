import 'package:flutter/material.dart';
import 'package:test/utils/my_cached_network_image.dart';
import 'package:test/view/register.dart';

import '../utils/constant.dart';
import '../utils/custom_cotainer.dart';
import '../utils/my_text_field.dart';
import 'otp.dart';
import 'package:global_configuration/global_configuration.dart';

class LoginPage extends StatelessWidget {
  static const route = "login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),

            Hero(
              tag: "app_icon",
              transitionOnUserGestures: true,
              child: CustomContainer(
                height: 100,
                width: 100,
                child: Image.asset(
                  "assets/icon/app_icon.png"
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _formLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _formLogin(context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "heading",
            child: Material(
              color: Constants.primary,
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Constants.black
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            child: MyTextField(
              labelText: "Phone Number",
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Constants.black
              ),
              isFilled: true,
              fillColor: Constants.primary,
              contentPadding: EdgeInsets.only(left: 30),
              borderColor: Constants.black,
              borderRadius: 15,
              keyboardType: TextInputType.number,
              elevation: 0,
              // focusedBorderColor: Constants.textFieldBackGround,
              textStyle: TextStyle(
                color: Constants.black,
                fontSize: 18,
              ),
              isLabelEnabled: false,
              hintText: "Phone Number",

              hintTextStyle: TextStyle(
                  fontSize: 18,
                  color: Constants.black
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
              onChanged: (value) {

              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            child: MyTextField(
              // controller: authController.loginPasswordField,
              labelText: "Password",
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Constants.black
              ),
              isFilled: true,
              fillColor: Constants.primary,
              contentPadding: EdgeInsets.only(left: 30),
              borderColor: Constants.black,
              borderRadius: 15,
              elevation: 0,
              // focusedBorderColor: Constants.textFieldBackGround,
              isPasswordField: true,
              textStyle: TextStyle(
                fontSize: 18,
                color: Constants.black,
              ),
              isLabelEnabled: false,
              hintText: "Password",
              hintTextStyle: TextStyle(
                  fontSize: 18,
                  color: Constants.black
              ),
              validator: (value) {
                if (value!.length < 8) {
                  return 'Please valid enter password';
                }
                return null;
              },
              onChanged: (value) {

              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Constants.black,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Constants.white,
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ElevatedButton(

                child: const CustomContainer(
                    elevation: 0,
                    width: double.infinity,
                    height: 50,
                    backgroundColor: Colors.transparent,
                    borderRadius: 15,
                    child: Center(
                        child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                color: Constants.white,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, OtpPage.route);
                },

                style: ElevatedButton.styleFrom(

                  primary: Constants.black,
                  onPrimary: Constants.fourthColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.route);
                  },
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 18,
                        color: Constants.black
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
