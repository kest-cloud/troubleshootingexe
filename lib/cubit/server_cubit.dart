import 'dart:io';

import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(ServerInitial()) {
    connect() async {
      try {
        final result =
            await InternetAddress.lookup('kesttestapp.herokuapp.com');
        // ignore: avoid_print, unnecessary_brace_in_string_interps
        print("${result}");
        if (result.isNotEmpty == true) {
          emit(ServerConnectedState(serverStatus: ServerStatus.connected));
        }
      } on Exception catch (e) {
        emit(ErrorState(e));
        emit(ServerDisconnectedState(serverStatus: ServerStatus.disconnected));
      }
    }

    connect();
  }
}
