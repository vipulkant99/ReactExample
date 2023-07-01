
import 'package:equatable/equatable.dart';

import '../../widgets/custom_error.dart';

enum LoginStatus { initial, loaded, loading, error, logged}

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final CustomError customError;
  const LoginState({
    required this.loginStatus,
    required this.customError,
  });

  @override
  String toString() => 'LoginState(loginStatus: $loginStatus, customError: $customError)';

  factory LoginState.initial()=>const LoginState(loginStatus: LoginStatus.initial, customError: CustomError());

  @override
  List<Object> get props => [loginStatus, customError];

  LoginState copyWith({
    LoginStatus? loginStatus,
    CustomError? customError,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      customError: customError ?? this.customError,
    );
  }
}
