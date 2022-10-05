import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvents extends Equatable {}

class LoadUserEvent extends UserEvents {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadedUsersEvent extends UserEvents {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ErrorEvent extends UserEvents {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
