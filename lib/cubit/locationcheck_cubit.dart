import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'locationcheck_state.dart';

class LocationcheckCubit extends Cubit<LocationcheckState> {
  late bool serviceEnabled;
  late LocationPermission permission;

  LocationcheckCubit() : super(LocationcheckInitial());

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    final LocationStatus locationStatus;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    print("$permission");
    print("$permission");
    if (permission == LocationPermission.whileInUse) {
      emit(LocationAcceptState(locationStatus: LocationStatus.whileInUse));

      if (permission == LocationPermission.denied) {
        emit(LocationDeniedState(locationStatus: LocationStatus.denied));
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
