import 'dart:io';
import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'datacheck_state.dart';

class DatacheckCubit extends Cubit<DatacheckState> {
  DatacheckCubit() : super(NoDataAccessState(dataCheck: DataCheck.notactive)) {
    dataconnect() async {
      try {
        final result = await InternetAddress.lookup('afolayanademola.com.ng');
        if (result.isNotEmpty == true) {
          emit(DataAccessState(dataCheck: DataCheck.active));
        }
      } on Exception catch (e) {
        emit(ErrorState(e));
        emit(NoDataAccessState(dataCheck: DataCheck.notactive));
      }
    }

    dataconnect();
  }
}
