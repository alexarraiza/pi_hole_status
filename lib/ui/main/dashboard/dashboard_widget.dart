import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pi_hole_status/ui/main/dashboard/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  final DashboardController controller;
  const Dashboard({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => _buildStatusCard(controller.status.value)),
        Obx(() => _buildHorizontalCards(
              'Dns queries today',
              '${controller.dnsQueriesToday.value}',
              'Unique clients',
              '${controller.uniqueClients.value}',
            )),
        Obx(() => _buildHorizontalCards(
              'Ads blocked today',
              '${controller.adsBlockedToday}',
              'Ads percentage today',
              '${controller.adsPercentageToday.round()}%',
            )),
        Obx(() => _buildHorizontalCards(
              'Domains on blocklist',
              '${controller.domainsBeingBlocked}',
              'Uptime',
              '${controller.uptime}',
            )),
        Obx(() => _buildPrivacyCard(controller.privacyLevel.value)),
      ],
    );
  }

  Widget _buildStatusCard(String status) {
    return Card(
      color: status == 'enabled' ? Colors.lightGreen.withOpacity(.6) : Colors.orange.withOpacity(.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            status,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyCard(int privacyLevel) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Privacy level'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$privacyLevel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalCards(String text1, String value1, String text2, String value2) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
