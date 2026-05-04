# HW4 – Book Club App (Flutter + GoRouter + AuthenticationBloc)

This project implements the Book Club App as described in HW4.

## Features
- GoRouter for navigation with named routes
- AuthenticationBloc for login/logout state management
- Redirect logic to protect routes based on authentication state
- ShellRoute for shared bottom navigation across tab pages
- Sort books by Author or Title
- Book detail page with back navigation

## Routes
- `/login` – Login page (unauthenticated users are redirected here)
- `/byAuthor` – Books sorted by author
- `/byAuthor/detail` – Book detail from author view
- `/byTitle` – Books sorted by title
- `/byTitle/detail` – Book detail from title view
- `/profile` – Profile page with logout

## To Run
flutter pub get
flutter run
