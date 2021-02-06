import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi_hole_status/ui/main/dashboard/dashboard_controller.dart';

import 'dashboard/dashboard_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Dashboard(
                controller: dashboardController,
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dashboardController.fetchPiholeStatus(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
