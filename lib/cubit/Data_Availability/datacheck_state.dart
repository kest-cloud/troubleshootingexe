part of 'datacheck_cubit.dart';

@immutable
abstract class DatacheckState {}

class DatacheckInitial extends DatacheckState {}

class DataAccessState extends DatacheckState {
  final DataCheck dataCheck;
  DataAccessState({required this.dataCheck});
}

class NoDataAccessState extends DatacheckState {
  final DataCheck dataCheck;
  NoDataAccessState({required this.dataCheck});
}

class ErrorState extends DatacheckState {
  final Exception error;
  ErrorState(this.error);
}
