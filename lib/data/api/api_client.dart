import 'package:dio/dio.dart';
import 'package:pi_hole_status/data/entities/pi_hole_status.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/admin/api.php")
  Future<PiHoleStatus> getState();
}
