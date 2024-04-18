import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';



import 'package:get/get.dart';


class BleController extends GetxController  {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future scanDevices() async {
    //check permissions
    // if (await Permission.bluetoothScan.request().isGranted) {
    //   if (await Permission.bluetoothConnect.request().isGranted) {
        flutterBlue.startScan(timeout: const Duration(seconds: 10));

        var subscription = flutterBlue.scanResults.listen((results) {
          for (ScanResult   r in results) {
            print('${r.device.name} found! rss1: ${r.rssi}');
          }
        });
        flutterBlue.stopScan();
    //   }
    // }
  }

  // ignore: non_constant_identifier_names
  Stream<List<ScanResult>> get  scanResult => flutterBlue.scanResults;
}

