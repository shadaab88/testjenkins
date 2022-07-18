import 'package:flutter/material.dart';
import 'package:test/utils/constant.dart';
import 'package:test/utils/route_generator.dart';
import 'package:get/get.dart';
import 'package:test/view/login.dart';
import 'package:global_configuration/global_configuration.dart';

import 'api/api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_config");
  await ApiService.getConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: GlobalConfiguration().getValue("app_icon") ?? "",
      theme: ThemeData(
        primaryColor: Constants.primary,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.route,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
