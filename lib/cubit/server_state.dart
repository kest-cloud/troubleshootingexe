part of 'server_cubit.dart';

@immutable
abstract class ServerState {}

class ServerInitial extends ServerState {}

class ServerConnectedState extends ServerState {
  final ServerStatus serverStatus;
  ServerConnectedState({required this.serverStatus});
}

class ServerDisconnectedState extends ServerState {
  final ServerStatus serverStatus;
  ServerDisconnectedState({required this.serverStatus});
}

class ErrorState extends ServerState {
  final Exception error;
  ErrorState(this.error);
}
