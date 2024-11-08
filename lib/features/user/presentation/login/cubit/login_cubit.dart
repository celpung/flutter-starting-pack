import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserUseCase userUseCase;

  LoginCubit(this.userUseCase) : super(LoginInitial());

  Future<void> loginUser(Login login) async {
    emit(LoginLoading());
    try {
      await userUseCase.login(login);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
