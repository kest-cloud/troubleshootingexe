import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late ScanResult scanResult;
  BluetoothCubit() : super(BluetoothInitial()) {
    /// Start scanning
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

// Listen to scan results
    // ignore: unused_local_variable
    var subscription = flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        await r.device.connect();
      }
    });

// Stop scanning
    flutterBlue.stopScan();

// Disconnect from device
    //r.device.disconnect();
  }
}
