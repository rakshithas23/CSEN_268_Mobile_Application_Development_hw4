import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'router/app_router.dart';

void main() {
  final authBloc = AuthenticationBloc();

  runApp(
    BlocProvider(
      create: (_) => authBloc,
      child: MyApp(authBloc: authBloc),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationBloc authBloc;

  const MyApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    final router = createRouter(authBloc);

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}