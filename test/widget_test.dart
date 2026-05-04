// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:book_club_hw4/main.dart';
import 'package:book_club_hw4/bloc/authentication/authentication_bloc.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    final authBloc = AuthenticationBloc();

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => authBloc,
        child: MyApp(authBloc: authBloc),
      ),
    );

    // Since your app starts with redirect → login
    expect(find.text('Login'), findsOneWidget);
  });
}
