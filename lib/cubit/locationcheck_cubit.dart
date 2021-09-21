import 'package:apptroubleshoot/constants/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'locationcheck_state.dart';

class LocationcheckCubit extends Cubit<LocationcheckState> {
  late bool serviceEnabled = true;

  //late LocationPermission permission;

  // ignore: empty_constructor_bodies
  LocationcheckCubit() : super(LocationcheckInitial()) {
    Future<Position> determinePosition() async {
      LocationPermission permission;

      //late LocationStatus locationStatus;
      if (!serviceEnabled) {
        permission = await Geolocator.requestPermission();
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.whileInUse) {
        emit(LocationAcceptState(locationStatus: LocationStatus.whileInUse));
      } else if (permission == LocationPermission.denied) {
        emit(LocationDeniedState(locationStatus: LocationStatus.denied));
      } else if (permission == LocationPermission.always) {
        emit(LocationAcceptEverState(locationStatus: LocationStatus.always));
      }

      return await Geolocator.getCurrentPosition();
    }

    determinePosition();
  }
}
