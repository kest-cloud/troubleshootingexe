import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

part 'datacheck_state.dart';

class DatacheckCubit extends Cubit<DatacheckState> {
  DatacheckCubit() : super(DatacheckInitial()) {
    connected() async {
      try {
        bool result = await DataConnectionChecker().hasConnection;
        if (result == true) {
          emit(DataAccessState(dataCheck: DataCheck.active));
        } else {
          emit(NoDataAccessState(dataCheck: DataCheck.notactive));

          //print(DataConnectionChecker().lastTryResults);
        }
      } on Exception catch (e) {
        emit(ErrorState(e));
      }
    }

    connected();
  }
}
