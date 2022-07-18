import 'dart:convert';

import 'package:dio/dio.dart' as di;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:global_configuration/global_configuration.dart';

import '../model/config_model.dart';
import '../utils/constant.dart';
import '../utils/utility.dart';
import 'api_route.dart';

class ApiService {

  static di.Dio _dioAccess(String? accessToken) {
    return di.Dio(
      di.BaseOptions(
        baseUrl: GlobalConfiguration().getValue("base_url") ?? "",
        headers: {
          'Authorization': 'Bearer $accessToken',
          di.Headers.acceptHeader: di.Headers.jsonContentType
        },
        contentType: di.Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll([
      PrettyDioLogger(
          requestBody: true, requestHeader: true, responseBody: true)
    ]);
  }

  static di.Dio _dioMultipart(String accessToken) {
    return di.Dio(
      di.BaseOptions(
        baseUrl: GlobalConfiguration().getValue("base_url") ?? "",
        headers: {
          "Authorization": "Bearer $accessToken",
          'Content-Type': 'multipart/form-data',
          "Accept": "application/json"
        },
        // contentType: di.Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll(
      [
        PrettyDioLogger(
            requestBody: true, requestHeader: true, responseBody: true),
      ],
    );
  }

  static di.Dio _dioGoogleAddress() {
    return di.Dio(
      di.BaseOptions(
        baseUrl: GlobalConfiguration().getValue("base_url") ?? "",
        queryParameters: {"key": Constants.googleMapKey},
        headers: {di.Headers.acceptHeader: di.Headers.jsonContentType},
      ),
    )..interceptors.addAll([
      PrettyDioLogger(
          requestBody: true, requestHeader: true, responseBody: true)
    ]);
  }

  static di.Dio _dio() {
    return di.Dio(
      di.BaseOptions(
        baseUrl: GlobalConfiguration().getValue("base_url") ?? "",
        headers: {
          di.Headers.acceptHeader: di.Headers.jsonContentType,
        },
        contentType: di.Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll([PrettyDioLogger(requestBody: true)]);
  }

  static Future<ConfigModel> getConfig() async {

    var response = await _dioAccess("").get("${ApiRoutes.config}",);
    print(response.data);

    ConfigModel data = ConfigModel.fromJson(json.decode(jsonEncode(response.data).toString())[0]);
    print("successfully get config data");
    print(data.appShareImage);

    // UiUtility.hideLoadingDialog();
    return data;
  }

}