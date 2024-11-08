import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/register_entity.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserUseCase userUseCase;

  RegisterCubit(this.userUseCase) : super(RegisterInitial());

  Future<void> registerUser(Register register) async {
    emit(RegisterLoading());
    try {
      await userUseCase.register(register);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
