part of 'internet_cubit_cubit.dart';

@immutable
abstract class InternetCubitState {}

class InternetCubitInitial extends InternetCubitState {}

class InternetLoadingState extends InternetCubitState {}

class InternetConnectedState extends InternetCubitState {
  final ConnectionStatus connectionStatus;
  InternetConnectedState({required this.connectionStatus});
}

class InternetDisconnectedState extends InternetCubitState {
  final ConnectionStatus connectionStatus;
  InternetDisconnectedState({required this.connectionStatus});
}
