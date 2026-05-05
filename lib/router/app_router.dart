import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/authentication/authentication_state.dart';
import '../screens/login_page.dart';
import '../screens/by_author_page.dart';
import '../screens/by_title_page.dart';
import '../screens/detail_page.dart';
import '../screens/profile_page.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream stream) {
       _subscription = stream.listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AuthenticationBloc authBloc) {
  return GoRouter(
    initialLocation: '/',

    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    redirect: (context, state) {
      final isLoggedIn = authBloc.state is Authenticated;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }

      if (isLoggedIn && isLoggingIn) {
        return '/byAuthor';
      }

      return null;
    },

    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: Scaffold(body: child)),
        routes: [
          GoRoute(path: '/', name: 'home', redirect: (context, state) => '/byAuthor'),
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ByAuthorPage()),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byAuthorDetail',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: DetailPage()),
              ),
            ],
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ByTitlePage()),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byTitleDetail',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: DetailPage()),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfilePage()),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LoginPage()),
      ),
    ],
  );
}
