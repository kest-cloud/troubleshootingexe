import 'dart:async';
import 'package:apptroubleshoot/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc/bloc.dart';

part 'internet_cubit_state.dart';

class InternetCubitCubit extends Cubit<InternetCubitState> {
  late Connectivity connectivity = Connectivity();
  late StreamSubscription connectivityStreamSubcription;
  late ConnectivityResult connectivityResult;

  InternetCubitCubit()
      : super(InternetDisconnectedState(
            connectionStatus: ConnectionStatus.none)) {
    connectivityStreamSubcription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      try {
        if (connectivityResult == ConnectivityResult.mobile) {
          emit(InternetConnectedState(
              connectionStatus: ConnectionStatus.mobile));
        } else if (connectivityResult == ConnectivityResult.none) {
          emit(InternetDisconnectedState(
              connectionStatus: ConnectionStatus.none));
        }
      } on Exception catch (e) {
        emit(ErrorState(e));
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubcription.cancel();
    return super.close();
  }
}
