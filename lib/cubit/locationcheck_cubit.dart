import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locationcheck_state.dart';

class LocationcheckCubit extends Cubit<LocationcheckState> {
  LocationcheckCubit() : super(LocationcheckInitial());
}
