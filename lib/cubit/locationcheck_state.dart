part of 'locationcheck_cubit.dart';

@immutable
abstract class LocationcheckState {}

class LocationcheckInitial extends LocationcheckState {}

class LocationAcceptState extends LocationcheckState {
  final LocationStatus locationStatus;
  LocationAcceptState({required this.locationStatus});
}

class LocationDeniedState extends LocationcheckState {
  LocationDeniedState();
}
