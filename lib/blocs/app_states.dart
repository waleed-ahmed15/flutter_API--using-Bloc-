import 'package:equatable/equatable.dart';
import 'package:flutterblocsimplest/models/user_model.dart';

abstract class UserState extends Equatable {}

// data loading state
class UserDataLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// data loaded state

class UserDataLoadedState extends UserState {
  final List<UserModel> users;
  UserDataLoadedState({required this.users});
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}
//error state failed to laod data

class DataErrorState extends UserState {
  String errorMsg;
  DataErrorState(this.errorMsg);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMsg];
}
