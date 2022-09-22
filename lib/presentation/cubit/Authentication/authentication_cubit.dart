import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lanuz_app/domain/usecase/update_coordinates.dart';

import '../../../domain/enitity/user_entity.dart';
import '../../../domain/usecase/create_table.dart';
import '../../../domain/usecase/login_user.dart';
import '../../../domain/usecase/register_user.dart';
import '../../../main.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final RegisterUser _register;
  final LoginUser _login;
  final CreateTable _create;
  final UpdateCoordinates _update;
  AuthenticationCubit(this._register, this._login, this._create, this._update)
      : super(AuthenticationInitial());

  void register(UserEntity user) async {
    emit(Authenticating());
    await _register(user);
  }

  void login(String email, String pword, Function function) async {
    final status = await _login(email, pword, function);
    if (status) {
      emit(Authenticating());

      globalSharedPreferences!.setString('email', email);
      emit(Authenticated());
    } else {
      emit(Authenticating());
      emit(UnAuthenticated());
    }
  }

  void createTable() async {
    emit(Authenticating());
    await _create();
  }

  void updateCoordinates(String coordinates) async {
    emit(Authenticating());
    await _update(coordinates);
  }

  void logout() async {
    emit(Authenticating());
    await globalSharedPreferences!.remove('email');
    emit(UnAuthenticated());
  }
}
