import 'package:cee_prototype/controllers/ble_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CEE HEALTH"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/cee_icon.png'),
            height: 500,
            width: 500,
          ),
          GetBuilder<BleController>(
              init: BleController(),
              builder: (BleController controller) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<List<ScanResult>>(
                            stream: controller.scanResult,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: ListView.builder(
                                      itemBuilder: ((context, index) {
                                    final data = snapshot.data![index];
                                    return Card(
                                      elevation: 2,
                                      child: ListTile(
                                        title: Text(data.device.name),
                                        subtitle: Text(data.device.id.id),
                                        trailing: Text(data.rssi.toString()),
                                      ),
                                    );
                                  })),
                                );
                                //do something with the data
                              } else {
                                return const Center(
                                  child: Text("No Device Found"),
                                );
                              }
                            }),
                      ]),
                );
              }),
          Center(
            child: ElevatedButton(
              onPressed: (() {
                print("GO TO STATEFUL WIDGET");
              }),
              child: const Text("Connect"),
            ),
          ),
        ],
      ),
    );
  }
}
