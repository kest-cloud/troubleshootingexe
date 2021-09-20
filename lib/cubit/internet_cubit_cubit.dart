import 'dart:async';
import 'package:apptroubleshoot/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'internet_cubit_state.dart';

class InternetCubitCubit extends Cubit<InternetCubitState> {
  late Connectivity connectivity = Connectivity();
  late StreamSubscription connectivityStreamSubcription;
  late ConnectivityResult connectivityResult;

  InternetCubitCubit() : super(InternetCubitInitial()) {
    connectivityStreamSubcription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      print("$connectivityResult");

      // ignore: unrelated_type_equality_checks
      if (connectivityResult == ConnectionStatus.mobile) {
        emitInternetConnected(ConnectionStatus.mobile);
        emit(InternetConnectedState(connectionStatus: ConnectionStatus.mobile));
        // ignore: unrelated_type_equality_checks

      } else if (connectivityResult == ConnectionStatus.none) {
        emitInternetDisconnected(ConnectionStatus.none);
        emit(InternetConnectedState(connectionStatus: ConnectionStatus.none));
      }
    });
  }

  void emitInternetConnected(ConnectionStatus _connectionStatus) =>
      emit(InternetConnectedState(connectionStatus: _connectionStatus));

  void emitInternetDisconnected(ConnectionStatus _connectionStatus) =>
      emit(InternetDisconnectedState(connectionStatus: _connectionStatus));

  @override
  Future<void> close() {
    connectivityStreamSubcription.cancel();
    return super.close();
  }
}
