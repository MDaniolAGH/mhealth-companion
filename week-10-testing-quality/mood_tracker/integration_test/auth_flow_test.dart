// Week 10 — TODO 6: End-to-end integration test for the auth flow.
//
// Goal: Launch the WHOLE app and walk through cold-start → login →
// home screen. Real ProviderScope, real widgets, mocked AuthService.
//
// What to write:
//   1. A test that cold-starts with NO token, then logs in and reaches
//      HomeScreen.
//   2. A test that cold-starts WITH a stored token and goes straight
//      to HomeScreen (auto-login).
//   3. A test that an AuthException keeps the user on LoginScreen and
//      shows the SnackBar.
//
// Running:
//   flutter test integration_test/auth_flow_test.dart
//   (Needs a connected device/simulator — run `flutter devices` first.)
//
// Why integration_test and not widget tests?
//   These tests run on a real device or simulator. They exercise routing
//   transitions, animations, and the full state machine end-to-end.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/providers/auth_provider.dart';
import 'package:mood_tracker/screens/home_screen.dart';
import 'package:mood_tracker/screens/login_screen.dart';
import 'package:mood_tracker/services/auth_service.dart';

// TODO 6.1: MockAuthService.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // late MockAuthService authService;

  setUp(() {
    // TODO 6.2: fresh mock per test.
  });

  testWidgets('cold-start with no token → LoginScreen → enter creds → HomeScreen',
      (tester) async {
    // TODO 6.3:
    //   - Stub getAccessToken() to return null
    //   - Stub login(...) to succeed
    //   - pumpWidget(ProviderScope(overrides: [...], child: MoodTrackerApp()))
    //   - pumpAndSettle() → assert LoginScreen visible
    //   - enterText, tap Sign In, pumpAndSettle()
    //   - assert HomeScreen visible and LoginScreen gone
  });

  testWidgets('cold-start with stored token → straight to HomeScreen',
      (tester) async {
    // TODO 6.4: Stub getAccessToken() to return a token,
    // pumpWidget + pumpAndSettle, assert HomeScreen present.
  });

  testWidgets('failed login keeps user on LoginScreen with SnackBar',
      (tester) async {
    // TODO 6.5: Stub login() to throw AuthException,
    // attempt login, assert user still on LoginScreen and SnackBar shows.
  });
}
