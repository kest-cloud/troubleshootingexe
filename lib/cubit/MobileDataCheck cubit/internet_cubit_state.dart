part of 'internet_cubit_cubit.dart';

abstract class InternetCubitState {}

class InternetCubitInitial extends InternetCubitState {
  InternetCubitInitial();
}

class InternetLoadingState extends InternetCubitState {
  InternetLoadingState();
}

class InternetConnectedState extends InternetCubitState {
  final ConnectionStatus connectionStatus;
  InternetConnectedState({required this.connectionStatus});
}

class InternetDisconnectedState extends InternetCubitState {
  final ConnectionStatus connectionStatus;
  InternetDisconnectedState({required this.connectionStatus});
}

class ErrorState extends InternetCubitState {
  final Exception error;
  ErrorState(this.error);
}
