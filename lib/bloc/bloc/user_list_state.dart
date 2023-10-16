part of 'user_list_bloc.dart';

@immutable
sealed class UserListState {
  final List<User> users;

  const UserListState({required this.users});
}

final class UserListInitial extends UserListState {
 const UserListInitial({required List<User>users}):super(users: users);
}

class UpdatedList extends UserListState {
 const UpdatedList({required List<User>users}):super(users: users);
}