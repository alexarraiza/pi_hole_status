import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi_hole_status/data/api/api_client.dart';
import 'package:pi_hole_status/ui/main/dashboard/dashboard_controller.dart';
import 'package:pi_hole_status/ui/main/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<ApiClient>(ApiClient(Dio(), baseUrl: 'http://192.168.1.227'));
    Get.lazyPut(() => DashboardController());

    return MaterialApp(
      title: 'pi.hole status',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MainPage(),
    );
  }
}
