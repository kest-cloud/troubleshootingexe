import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothDevState> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothCheckState bluetoothState;
  late ScanResult scanResult;

  BluetoothCubit() : super(BluetoothInitial()) {
    Future _bluetoothCheckTest() async {
      FlutterBlue flutterBlue = FlutterBlue.instance;
      flutterBlue.state.asBroadcastStream().listen((event) {
        if (event.index < 5) {
          emit(BluetoothConnectedState(
              bluetoothCheckState: BluetoothCheckState.active));
        } else {
          emit(BluetoothDisconnectedState(
              bluetoothCheckState: BluetoothCheckState.off));
        }
      });
    }

    _bluetoothCheckTest();
  }
}
