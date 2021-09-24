part of 'locationcheck_cubit.dart';

abstract class LocationcheckState {}

class LocationcheckInitial extends LocationcheckState {}

class LocationAcceptState extends LocationcheckState {
  final LocationStatus locationStatus;
  LocationAcceptState({required this.locationStatus});
}

class LocationAcceptEverState extends LocationcheckState {
  final LocationStatus locationStatus;
  LocationAcceptEverState({required this.locationStatus});
}

class LocationDeniedState extends LocationcheckState {
  final LocationStatus locationStatus;
  LocationDeniedState({required this.locationStatus});
}

class ErrorState extends LocationcheckState {
  final Exception error;
  ErrorState(this.error);
}
