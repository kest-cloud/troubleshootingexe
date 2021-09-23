import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothDeviceState> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothCheckState bluetoothState;
  late ScanResult scanResult;

  BluetoothCubit() : super(BluetoothInitial()) {
    Future _bluetoothCheckTest() async {
      FlutterBlue flutterBlue = FlutterBlue.instance;

      flutterBlue.isOn.asStream().listen((event) {
        if (event) {
          emit(BluetoothConnectedState(
              bluetoothCheckState: BluetoothCheckState.active));
        } else {
          emit(BluetoothDisconnectedState());
        }
      });
    }

    _bluetoothCheckTest();
  }
}
