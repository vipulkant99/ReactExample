part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String email;
  final String pass;
  const LoginUser({
    required this.email,
    required this.pass,
  });
}

class ToggleScreens extends LoginEvent {
  final LoginStatus statess;
  const ToggleScreens({
    required this.statess,
  });
}
