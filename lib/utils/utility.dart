import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constant.dart';
import 'custom_cotainer.dart';
import 'loading_dialog.dart';

class Utility {
  static void showToast(String msg, String body) {
    Get.snackbar(msg, body,
        backgroundColor: Constants.primary,
        backgroundGradient: const LinearGradient(
          colors: [Constants.primary, Constants.secondaryColor],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        colorText: Constants.white,
        animationDuration: const Duration(milliseconds: 900),
        duration: const Duration(milliseconds: 1200),
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }

  static String formateDate(DateTime date) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static String dateTimeStringToDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy  hh:mm a')
        .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime));
  }

  static String dateTimeToDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy  hh:mm a').format(dateTime);
  }

  static String formateDateWithMonth(DateTime date) {
    // return DateFormat.yMMMMd().format(date);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static void showSingleTextToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Constants.fourthColor,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static void showSingleSuccessToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Constants.fourthColor,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static void showLoadingDialog() {
    Get.dialog(LoadingDialog(), barrierDismissible: true);
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) Get.back();
  }

  void showErrorMessage(String error,{String? msg = ""}) {
    Get.snackbar((msg! == "")?"Error":msg, "$error",
        backgroundColor: Constants.fourthColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20));
  }

  void showSuccessMessage(String error,{String? msg = ""}) {
    Get.snackbar((msg! == "")?"Success":msg, "$error",
        backgroundColor: Constants.fourthColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20));
  }



  static Widget myDialog() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Constants.secondaryColor,
        ),
      ),
    );
  }

  static void showToastSuccess(String msg, String body) {
    Get.snackbar(msg, body,
        backgroundColor: Constants.fourthColor,
        backgroundGradient: const LinearGradient(
          colors: [Constants.fourthColor, Constants.fourthColor],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        colorText: Constants.black,
        animationDuration: const Duration(milliseconds: 900),
        duration: const Duration(milliseconds: 900),
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }

  static Widget middleGapDivider(double thickness) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Divider(
          thickness: thickness,
          color: Constants.lightGrey,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  static void showToastError(String msg, String body, {final time}) {
    Get.snackbar(msg, body,
        backgroundColor: Constants.blue,
        backgroundGradient: LinearGradient(
          colors: [Constants.blue, Constants.blue1],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        animationDuration: time ?? const Duration(seconds: 1),
        colorText: Constants.white,
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }

  Future<dynamic> showUpdate(BuildContext context,bool isSkip) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              // height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "A new update available",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'A new update Available'),
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomContainer(
                            height: 50,
                            onTap: () {
                              // InAppUpdate.performImmediateUpdate()
                              //     .catchError((e) => showSnack(e.toString()));

                            },
                            child: const Center(
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: Constants.secondaryColor,
                          ),
                        ),
                        (!isSkip)?Expanded(
                          child: CustomContainer(
                            height: 50,
                            onTap: () {
                              // InAppUpdate.performImmediateUpdate()
                              //     .catchError((e) => showSnack(e.toString()));
                              Get.back();
                            },
                            child: const Center(
                              child: Text(
                                "Skip",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: Constants.secondaryColor,
                          ),
                        ):Container(),


                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showCustomDialog(Widget child,double height,double width) {
    Get.dialog(myCustomDialog(child,height,width), barrierDismissible: true);
  }

  static Widget myCustomDialog(Widget child,double height, double width) {
    return Center(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: child,
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }
}
