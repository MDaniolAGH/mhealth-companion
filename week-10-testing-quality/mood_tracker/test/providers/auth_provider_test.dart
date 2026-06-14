// Week 10 — TODO 3: Test the AuthNotifier state machine with ProviderContainer.
//
// Goal: Test state transitions WITHOUT spinning up a widget tree.
//
// What to write:
//   1. Test that the initial state is AuthState.initial.
//   2. Test checkAuth() with a stored token → AuthState.authenticated.
//   3. Test checkAuth() with no token → AuthState.unauthenticated.
//   4. Test login() success → emits [loading, authenticated].
//   5. Test login() failure → emits [loading, unauthenticated] AND
//      rethrows the AuthException.
//   6. Test logout() deletes tokens AND transitions to unauthenticated.
//
// The ProviderContainer pattern:
//   final container = ProviderContainer(overrides: [
//     someProvider.overrideWithValue(mockedValue),
//   ]);
//
//   container.read(myProvider)           // current value
//   container.read(myProvider.notifier)  // the StateNotifier
//   container.listen(myProvider, callback) // observe state changes
//
//   Always call container.dispose() in tearDown.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mood_tracker/providers/auth_provider.dart';
import 'package:mood_tracker/services/auth_service.dart';

// TODO 3.1: Define MockAuthService.

void main() {
  // late MockAuthService authService;
  // late ProviderContainer container;

  setUp(() {
    // TODO 3.2: Construct MockAuthService and a ProviderContainer that
    // overrides authServiceProvider with the mock.
  });

  tearDown(() {
    // TODO 3.3: container.dispose();
  });

  test('initial state is AuthState.initial', () {
    // TODO 3.4: expect(container.read(authProvider), AuthState.initial);
  });

  group('checkAuth', () {
    test('transitions to authenticated when a stored token exists', () async {
      // TODO 3.5: stub getAccessToken() to return 'some-jwt',
      // call container.read(authProvider.notifier).checkAuth(),
      // assert state is authenticated.
    });

    test('transitions to unauthenticated when no token is stored', () async {
      // TODO 3.6: stub getAccessToken() to return null, same flow,
      // assert state is unauthenticated.
    });
  });

  group('login', () {
    test('emits loading then authenticated on success', () async {
      // TODO 3.7:
      //   - stub authService.login(any(), any()) to succeed
      //   - collect states with container.listen<AuthState>(...)
      //   - call container.read(authProvider.notifier).login(...)
      //   - assert collected states == [loading, authenticated]
    });

    test('emits loading then unauthenticated + rethrows on AuthException',
        () async {
      // TODO 3.8: same pattern but throw, assert states + exception.
    });
  });

  group('logout', () {
    test('deletes tokens and transitions to unauthenticated', () async {
      // TODO 3.9: verify deleteTokens was called, state is unauthenticated.
    });
  });
}
