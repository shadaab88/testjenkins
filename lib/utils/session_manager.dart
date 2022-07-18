import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class SessionManager {
  static const String ACCESS_TOKEN = "ACCESS_TOKEN";
  static const String USER_ID = "USER_ID";
  static const String USER_PHONE = "USER_PHONE";
  static const String FCM_TOKEN = "FCM_TOKEN";
  static const String address = "address";
  static const String stateCode = "stateCode";
  static const String city = "city";
  static const String lat = "lat";
  static const String lng = "lng";
  static const String MAP_API_KEY = "MAP_API_KEY";
  static const String REFER_CODE = "REFER_CODE";
  static const String SHARE_STORE_ID = "SHARE_STORE_ID";
  static const String SHARE_PRODUCT_ID = "SHARE_PRODUCT_ID";
  static const String isFirstTime = "IS_FIREST_TIME";
  static const String Register_For = 'Register_For';

  static Future<void> saveAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN, value);
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }

  static Future<void> saveFCMToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(FCM_TOKEN, value);
  }

  static Future<String?> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(FCM_TOKEN);
  }

  static Future<void> saveUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_ID, value);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_ID);
  }

  static Future<void> saveUserPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_PHONE, value);
  }

  static Future<String?> getUserPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_PHONE);
  }

  static Future<void> saveIsFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstTime, value);
  }

  static Future<bool?> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTime);
  }

  static Future<void> saveAddress(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(address, value);
  }

  static Future<String?> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(address);
  }

  static Future<void> saveReferCode(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(REFER_CODE, value);
  }

  static Future<String?> getReferCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(REFER_CODE);
  }

  static Future<void> saveShareStoreID(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SHARE_STORE_ID, value);
  }

  static Future<String?> getShareStoreID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SHARE_STORE_ID);
  }

  static Future<void> saveShareProductID(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SHARE_PRODUCT_ID, value);
  }

  static Future<String?> getShareProductID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SHARE_PRODUCT_ID);
  }

  static Future<void> saveStateCode(String stateCod) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(stateCode, stateCod);
  }

  static Future<String?> getStateCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stateCode);
  }

  static Future<void> saveLat(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lat, value);
  }

  static Future<double?> getLat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(lat);
  }

  static Future<void> saveLng(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lng, value);
  }

  static Future<double?> getLng() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(lng);
  }

  static Future<void> saveGoogleApiKey(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MAP_API_KEY, value);
  }

  static Future<String?> getGoogleMapApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(MAP_API_KEY) == "" || !prefs.containsKey(MAP_API_KEY)) {
      return Constants.googleMapKey;
    }
    return prefs.getString(MAP_API_KEY);
  }

  static Future<String?> getRegisterFor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Register_For);
  }

  static Future<void> saveRegisterFor(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Register_For, value);
  }

  static Future<String?> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(city);
  }

  static Future<void> saveCity(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(city, value);
  }
}
