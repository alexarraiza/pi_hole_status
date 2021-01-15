import 'package:flutter/material.dart';
import 'package:pi_hole_status/data/entities/pi_hole_state.dart';

class StatusDashboard extends StatelessWidget {
  final PiHoleState status;

  const StatusDashboard({Key key, @required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildStatusCard(),
        _buildHorizontalCards(
          'Dns queries today',
          '${status.dnsQueriesToday}',
          'Unique clients',
          '${status.uniqueClients}',
        ),
        _buildHorizontalCards(
          'Ads blocked today',
          '${status.adsBlockedToday}',
          'Ads percentage today',
          '${status.adsPercentageToday.round()}%',
        ),
        _buildHorizontalCards(
          'Domains on blocklist',
          '${status.domainsBeingBlocked}',
          'Uptime',
          '${status.gravityLastUpdated.relative.toString()}',
        ),
        _buildPrivacyCard(),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Card(
      color: status.status == 'enabled' ? Colors.lightGreen.withOpacity(.6) : Colors.orange.withOpacity(.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            status.status,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyCard() {
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
                '${status.privacyLevel}',
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
