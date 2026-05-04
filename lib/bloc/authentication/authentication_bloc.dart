import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc() : super(Unauthenticated());

  void logIn() => emit(Authenticated());

  void logOut() => emit(Unauthenticated());
}