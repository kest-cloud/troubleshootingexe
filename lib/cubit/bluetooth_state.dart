part of 'bluetooth_cubit.dart';

abstract class BluetoothState {}

class BluetoothInitial extends BluetoothState {}

class BluetoothConnectedState extends BluetoothState {
  BluetoothConnectedState();
}

class BluetoothDisconnectedState extends BluetoothState {
  BluetoothDisconnectedState();
}

class ErrorState extends BluetoothState {
  final Exception error;
  ErrorState(this.error);
}
