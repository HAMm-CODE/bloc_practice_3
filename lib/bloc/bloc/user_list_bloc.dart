import 'package:bloc/bloc.dart';
import 'package:bloc_practice_3/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(const UserListInitial(users: [])) {
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<UserListState> emit) {
    state.users.add(event.user);
    emit(UpdatedList(users: state.users));
  }

  void _deleteUser(DeleteUser event, Emitter<UserListState> emit) {
    state.users.remove(event.user);
    emit(UpdatedList(users: state.users));
  }

  void _updateUser(UpdateUser event, Emitter<UserListState> emit) {
    for (var element in state.users) {
      if (element.id == event.user.id) {
        element = event.user;
      }
    }
    state.users.add(event.user);
    emit(UpdatedList(users: state.users));
  }
}
