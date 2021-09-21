// import 'package:bloc/bloc.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// part 'bluetooth_state.dart';

// class BluetoothCubit extends Cubit<BluetoothDeviceState> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   late BluetoothState bluetoothState;
//   late ScanResult scanResult;

//   BluetoothCubit() : super(BluetoothInitial())  {
//      FlutterBlue flutterBlue = FlutterBlue.instance;
//      FlutterBlue.instance.connectedDevices;

//      var subscription = flutterBlue.scanResults.listen((results) async {
//            for (ScanResult r in results) {
//         print('${r.device.name} found! rssi: ${r.rssi}');
//         await r.device.connect();
//       }
//     });
   
//     flutterBlue.startScan(timeout: const Duration(seconds: 6));
//     // ignore: unused_local_variable
//     Future<FlutterBlue> deviceStateSubscription =   r.device.name.onStateChanged().listen((s) {
//           var deviceState = s;
// });

//     FlutterBlue.instance.connectedDevices;
//     bool get isConnected => (deviceState == bluetoothState.on);
    

// // Stop scanning
//     flutterBlue.stopScan();
    
    
    

// // Disconnect from device
//     //r.device.disconnect();
//   }


//    @override
//   Future<void> close() {
//    deviceStateSubscription.cancel();
//     return super.close();
//   }
// }
