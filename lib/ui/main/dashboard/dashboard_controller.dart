import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pi_hole_status/data/api/api_client.dart';
import 'package:pi_hole_status/data/entities/pi_hole_status.dart';

class DashboardController extends GetxController {
  var status = ''.obs;
  var dnsQueriesToday = 0.obs;
  var uniqueClients = 0.obs;
  var adsBlockedToday = 0.obs;
  var adsPercentageToday = 0.0.obs;
  var domainsBeingBlocked = 0.obs;
  var uptime = ''.obs;
  var privacyLevel = 0.obs;

  fetchPiholeStatus() async {
    ApiClient apiClient = Get.find();
    PiHoleStatus piHoleStatus = await apiClient.getState();
    status.value = piHoleStatus.status;
    dnsQueriesToday.value = piHoleStatus.dnsQueriesToday;
    uniqueClients.value = piHoleStatus.uniqueClients;
    adsBlockedToday.value = piHoleStatus.adsBlockedToday;
    adsPercentageToday.value = piHoleStatus.adsPercentageToday;
    domainsBeingBlocked.value = piHoleStatus.domainsBeingBlocked;
    uptime.value = piHoleStatus.gravityLastUpdated.relative.toString();
    privacyLevel.value = piHoleStatus.privacyLevel;
  }
}
