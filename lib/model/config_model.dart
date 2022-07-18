// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConfigModel {
  ConfigModel({
    this.razorKey,
    this.razorSecret,
    this.usernameSuggestions,
    this.merchantRadius,
    this.appShareImage,
    this.appHomeInviteImage,
    this.showSpinWheel,
    this.zicoinsRequiredForSpinWheel,
  });

  String? razorKey;
  String? razorSecret;
  String? usernameSuggestions;
  String? merchantRadius;
  String? appShareImage;
  String? appHomeInviteImage;
  bool? showSpinWheel = true;
  String? zicoinsRequiredForSpinWheel = "49";

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    razorKey: json["RAZOR_KEY"] ?? "",
    razorSecret: json["RAZOR_SECRET"] ?? "",
    usernameSuggestions: json["username_suggestions"] ?? "",
    merchantRadius: json["merchant_radius"] ?? "",
    appShareImage: json["app_share_image"] ?? "",
    appHomeInviteImage: json["app_home_invite_image"] ?? "",
    showSpinWheel: json["show_spin_wheel"] ?? true,
    zicoinsRequiredForSpinWheel: json["zicoins_required_for_spin_wheel"] ?? "49",
  );

  Map<String, dynamic> toJson() => {
    "RAZOR_KEY": razorKey,
    "RAZOR_SECRET": razorSecret,
    "username_suggestions ": usernameSuggestions,
    "merchant_radius": merchantRadius,
    "app_share_image": appShareImage,
    "app_home_invite_image": appHomeInviteImage,
    "show_spin_wheel": showSpinWheel,
    "zicoins_required_for_spin_wheel": zicoinsRequiredForSpinWheel,
  };
}
