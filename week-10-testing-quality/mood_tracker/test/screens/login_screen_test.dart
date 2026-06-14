// Week 10 — TODO 4: Widget test for LoginScreen.
//
// Goal: Test that the UI calls the right provider methods with the right
// arguments. We do NOT test the real backend here.
//
// What to write:
//   1. Test that the screen renders Email + Password fields and a
//      "Sign In" button.
//   2. Test that tapping Sign In with filled fields calls
//      authService.login(email, password) exactly once.
//   3. Test that an AuthException shows a SnackBar with the message.
//   4. Test that empty email shows the validator error and does NOT
//      call login() (form validation guards the submit).
//
// The pumpWidget pattern:
//   await tester.pumpWidget(
//     ProviderScope(
//       overrides: [authServiceProvider.overrideWithValue(mock)],
//       child: const MaterialApp(home: LoginScreen()),
//     ),
//   );
//
// Useful finders:
//   find.text('Sign In')
//   find.widgetWithText(TextFormField, 'Email')
//   find.byType(FilledButton)
//   find.byKey(Key('email-field'))   // if widgets had Keys
//
// Useful actions:
//   await tester.enterText(finder, 'value');
//   await tester.tap(finder);
//   await tester.pump();           // advance one frame
//   await tester.pumpAndSettle();  // advance until animations stop

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mood_tracker/providers/auth_provider.dart';
import 'package:mood_tracker/screens/login_screen.dart';
import 'package:mood_tracker/services/auth_service.dart';

// TODO 4.1: MockAuthService.

void main() {
  // late MockAuthService authService;

  setUp(() {
    // TODO 4.2: fresh mock per test.
  });

  // TODO 4.3: a `pumpLogin(tester)` helper that wraps LoginScreen in a
  // ProviderScope (with the override) inside a MaterialApp. Reused
  // by every test.

  testWidgets('renders email and password fields', (tester) async {
    // TODO 4.4: pumpLogin, then assert the two TextFormFields and the
    // Sign In button are present.
  });

  testWidgets('Sign In tap calls login() with form values', (tester) async {
    // TODO 4.5:
    //   - stub authService.login(any(), any()) to succeed
    //   - enter text in Email and Password fields
    //   - tap Sign In, pump
    //   - verify(() => authService.login('email', 'pw')).called(1)
  });

  testWidgets('shows SnackBar with AuthException message on failure',
      (tester) async {
    // TODO 4.6: stub login() to throw AuthException('...'),
    // tap Sign In, pump, expect the message text on screen.
  });

  testWidgets('validator: empty email blocks submit', (tester) async {
    // TODO 4.7: leave email empty, tap Sign In, assert the validator
    // text appears and verifyNever the login call.
  });
}
