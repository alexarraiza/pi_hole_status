import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_status/data/api/api_client.dart';
import 'package:pi_hole_status/data/entities/pi_hole_state.dart';
import 'package:pi_hole_status/ui/main/status_dashboard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController textEditingController = TextEditingController();
  ApiClient apiClient;
  String piHoleUrlPrefix = 'http://';
  String piHoleUrl;
  Future<PiHoleState> getStateFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text('HTTP'),
                          value: 'http://',
                        ),
                        DropdownMenuItem(
                          child: Text('HTTPS'),
                          value: 'https://',
                        )
                      ],
                      value: piHoleUrlPrefix,
                      onChanged: (value) => setState(() {
                        piHoleUrlPrefix = value;
                      }),
                    ),
                  ),
                  Expanded(
                      child: TextField(
                    controller: textEditingController,
                    maxLines: 1,
                    minLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'pi hole URL'),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        print(piHoleUrlPrefix + textEditingController.text);
                        setState(() {
                          apiClient = ApiClient(Dio(), baseUrl: piHoleUrlPrefix + textEditingController.text);
                          getStateFuture = apiClient.getState();
                        });
                      },
                    )),
                  )
                ],
              ),
              if (apiClient != null)
                Expanded(
                  child: FutureBuilder(
                    builder: (context, AsyncSnapshot<PiHoleState> snapshot) {
                      if (snapshot.hasData) {
                        return StatusDashboard(status: snapshot.data);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                    future: getStateFuture,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
