part of 'bluetooth_cubit.dart';

abstract class BluetoothDevState {}

class BluetoothInitial extends BluetoothDevState {}

class BluetoothConnectedState extends BluetoothDevState {
  final BluetoothCheckState bluetoothCheckState;
  BluetoothConnectedState({required this.bluetoothCheckState});
}

class BluetoothDisconnectedState extends BluetoothDevState {
  final BluetoothCheckState bluetoothCheckState;
  BluetoothDisconnectedState({required this.bluetoothCheckState});
}

class ErrorState extends BluetoothDevState {
  final Exception error;
  ErrorState(this.error);
}
