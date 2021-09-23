part of 'bluetooth_cubit.dart';

abstract class BluetoothDeviceState {}

class BluetoothInitial extends BluetoothDeviceState {}

class BluetoothConnectedState extends BluetoothDeviceState {
  final BluetoothCheckState bluetoothCheckState;
  BluetoothConnectedState({required this.bluetoothCheckState});
}

class BluetoothDisconnectedState extends BluetoothDeviceState {
  BluetoothDisconnectedState();
}

class ErrorState extends BluetoothDeviceState {
  final Exception error;
  ErrorState(this.error);
}
