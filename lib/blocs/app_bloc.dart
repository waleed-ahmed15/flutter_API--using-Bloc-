import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsimplest/blocs/app_events.dart';
import 'package:flutterblocsimplest/blocs/app_states.dart';
import 'package:flutterblocsimplest/models/user_model.dart';
import 'package:flutterblocsimplest/repos/repos.dart';

// events are added and states are emitted always
//remember that events area added and states are emmitted
class UserBloc extends Bloc<UserEvents, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserDataLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserDataLoadingState());

      try {
        List<UserModel> users = await _userRepository.getusers();
        emit(UserDataLoadedState(users: users));
      } catch (e) {
        emit(DataErrorState(e.toString()));
        print(e);
      }
    });
  }
}
