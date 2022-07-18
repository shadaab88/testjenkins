import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'custom_container_gradiant.dart';
import 'custom_cotainer.dart';

class CustomBottomSheets {
  static showBottomSheetWithClose(Widget child, BuildContext context) {
    showCustomModalBottomSheet(
      expand: false,
      bounce: true,
      context: context,
      enableDrag: true,
      duration: Duration(milliseconds: 500),
      containerWidget: (context, animation, child) {
        return child;
      },
      // shape: Border(
      //   top: BorderSide(width: 1, color: Constant.black),
      // ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomContainerGradients(
                      borderBottomLeftRadius: 0,
                      borderTopLeftRadius: 15,
                      borderTopRightRadius: 15,
                      borderBottomRightRadius: 0,
                      backgroundColor: Colors.white,
                      borderColor: Constants.white,
                      padding: 0,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Align(
                        child: child,
                        alignment: Alignment.bottomCenter,
                      ),
                      // height:
                      //     MediaQuery.of(context).size.height * 0.8,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  static showBottomSheetWithHeight(
      Widget child, BuildContext context, {double? height}) {
    showCustomModalBottomSheet(
      isDismissible: true,
      expand: false,
      bounce: true,
      context: context,
      enableDrag: true,
      duration: const Duration(milliseconds: 500),
      containerWidget: (context, animation, child) {
        return child;
      },

      shape: const RoundedRectangleBorder(// <-- SEE HERE

        borderRadius: BorderRadius.vertical(

          top: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return Container(
          height: height ?? MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: mediaQueryData.viewInsets,
              child: Container(
                  height: height ?? MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      CustomContainerGradients(
                        width: MediaQuery.of(context).size.width,

                        borderBottomLeftRadius: 0,
                        borderTopLeftRadius: 0,
                        borderTopRightRadius: 0,
                        borderBottomRightRadius: 0,
                        borderRadius: 20,
                        backgroundColor: Colors.white,
                        borderColor: Constants.white,
                        padding: 0,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 18.0, right: 18, top: 20, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                height: 12,
                                width: 100,
                                // backgroundColor: Constants.lightGrey,
                                backgroundColor: Constants.white,
                              ),

                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  "assets/svg/close.svg",
                                  color: Constants.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomContainerGradients(
                          borderBottomLeftRadius: 0,
                          borderTopLeftRadius: 20,
                          borderTopRightRadius: 20,
                          borderBottomRightRadius: 0,
                          backgroundColor: Colors.white,
                          borderColor: Constants.white,
                          padding: 0,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Align(
                            child: child,
                            alignment: Alignment.bottomCenter,
                          ),
                          // height:
                          //     MediaQuery.of(context).size.height * 0.8,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}