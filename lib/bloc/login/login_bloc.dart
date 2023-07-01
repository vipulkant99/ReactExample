import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:react_example/bloc/login/login_state.dart';
import 'package:react_example/repo/main_repo.dart';

import '../../widgets/custom_error.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final MainRepo mainRepository;
  LoginBloc({required this.mainRepository}) : super(LoginState.initial()) {
    on<ToggleScreens>(_change);
    on<LoginUser>(_loginUser);
  }

  Future<void> _loginUser(
    LoginUser event,
    Emitter<LoginState> emit
  ) async{
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try{
      final userData = await mainRepository.loginUser(event.email, event.pass);
      print("users $userData");
      if(userData["success"]){
        emit(state.copyWith(loginStatus: LoginStatus.logged));
      }else{
        emit(state.copyWith(loginStatus: LoginStatus.error, customError: CustomError(errorMsg: userData["message"])));
      }
    }on CustomError catch(e){
      emit(state.copyWith(loginStatus: LoginStatus.error, customError: e));
    }
  }

  Future<void> _change(
    ToggleScreens event,
    Emitter<LoginState> emit
  ) async{
    emit(state.copyWith(loginStatus: event.statess));
  }
}
