import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/domain/entities/api_error.dart';
import 'package:flutter_base_project/domain/entities/auth/user.dart';
import 'package:flutter_base_project/domain/usecases/authentication.usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationUseCase useCase;

  LoginBloc(this.useCase) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const LoginState.loading());

      final result = await useCase.loginIn(event.email, event.password);

      emit(result.fold(
        (exception) => LoginState.error(ApiError(message: exception.message)),
        (user) => LoginState.success(user),
      ));
    });
  }
}
