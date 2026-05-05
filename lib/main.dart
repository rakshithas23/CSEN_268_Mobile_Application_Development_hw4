import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AuthenticationBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();
    final router = createRouter(authBloc);

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}