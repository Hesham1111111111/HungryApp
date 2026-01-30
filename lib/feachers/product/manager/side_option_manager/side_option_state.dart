import 'package:hungry/feachers/product/data/model/side_options_model.dart';


abstract class SideOptionsState {}

class InitialSideOptionsState extends SideOptionsState {}

class LoadingSideOptionsState extends SideOptionsState {}

class SuccessSideOptionsState extends SideOptionsState {
  final List<SideOptionsModel> sideOptions;

  SuccessSideOptionsState({required this.sideOptions});
}

class ErrorSideOptionsState extends SideOptionsState {
  final String errorMassege;

  ErrorSideOptionsState({required this.errorMassege});
}
