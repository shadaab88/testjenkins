import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/custom_cotainer.dart';
import '../utils/otp_input.dart';

class OtpPage extends StatelessWidget {
  static const route = "otp_page";

  final PinDecoration _pp = const BoxLooseDecoration(
      enteredColor: Colors.black,
      textStyle: TextStyle(
          fontSize: 20,
          color: Constants.black
      )
  );

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
                child: Image.asset(
                    "assets/icon/app_icon.png"
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _formOtp(context),
          ],
        ),
      ),
    );
  }

  Widget _formOtp(context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Hero(
            tag: "heading",
            child: Material(
              color: Constants.primary,
              child: Text(
                'OTP Verification',
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
            child: PinInputTextField(
              pinLength: 6,
              decoration: _pp,
              // controller: authController.otpController,
              autoFocus: true,
              textInputAction: TextInputAction.done,
              onChanged: (v) {
                // authController.val = v;
                if(v.length ==6){
                  // submitOTP("");
                  // _onFormSubmitted();
                }
              },
              // onSubmit: (pin) {
              //   if (pin.length == 6) {
              //     _onFormSubmitted();
              //   } else {
              //     showToast("Invalid OTP", Colors.red);
              //   }
              // },
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
                            "Submit",
                            style: TextStyle(
                                fontSize: 18,
                                color: Constants.white,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                ),
                onPressed: () {

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

                  },
                  child: const Text(
                    "Didn't get the code?",
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
