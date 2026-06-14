// Week 10 — TODO 2: Unit tests for AuthService with mocktail.
//
// Goal: Test login/register/logout without making real network calls or
// touching real secure storage.
//
// What to write:
//   1. Test that login() sends form-encoded credentials with the
//      `username` field (OAuth2 convention — NOT `email`).
//   2. Test that login() saves both tokens on a 200 response.
//   3. Test that login() throws AuthException with the standard
//      "Incorrect email or password." message on a 401.
//   4. Test that register() sends a JSON body and returns on 201.
//   5. Test that deleteTokens() (logout) removes both keys from storage.
//
// The mocktail pattern:
//   1. Define a mock class:    class MockX extends Mock implements X {}
//   2. Create an instance:     final x = MockX();
//   3. Stub a method:          when(() => x.foo(any())).thenAnswer(...);
//   4. Verify it was called:   verify(() => x.foo(...)).called(1);
//
// Special mocktail rules:
//   - For matchers like `any()` with non-primitive types (Uri, Map),
//     register a Fake fallback in setUpAll(): registerFallbackValue(...)
//   - For named arguments use any(named: 'name').
//   - Use captureAny() / captureAny(named: ...) to capture arguments
//     for inspection: `verify(...).captured` returns a list.

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:mood_tracker/services/auth_service.dart';

// TODO 2.1: Declare two mock classes — one for http.Client, one for
// FlutterSecureStorage. They both extend Mock and implement the real type.
//
// class MockHttpClient extends Mock implements http.Client {}
// class MockSecureStorage extends Mock implements FlutterSecureStorage {}

// Fake fallback for the Uri type (required by any() with non-primitives)
class _FakeUri extends Fake implements Uri {}

void main() {
  setUpAll(() {
    // TODO 2.2: Register fallback values for Uri and Map<String, String>.
    // registerFallbackValue(_FakeUri());
    // registerFallbackValue(<String, String>{});
  });

  // late MockHttpClient client;
  // late MockSecureStorage storage;
  // late AuthService auth;

  setUp(() {
    // TODO 2.3: Create fresh mocks and a fresh AuthService instance,
    // injecting both mocks via the constructor.

    // TODO 2.4: Default storage.write to succeed:
    //   when(() => storage.write(key: any(named: 'key'), value: any(named: 'value')))
    //       .thenAnswer((_) async {});
    //
    // and storage.read to return null:
    //   when(() => storage.read(key: any(named: 'key')))
    //       .thenAnswer((_) async => null);
  });

  group('AuthService.login', () {
    test('sends form-encoded credentials with `username` field (OAuth2)',
        () async {
      // TODO 2.5:
      //   - Stub client.post(...) to return a 200 with a body containing
      //     access_token and refresh_token.
      //   - Call auth.login(email, password).
      //   - Use verify(() => client.post(...)).captured to inspect args.
      //   - Assert URL path is '/auth/login'.
      //   - Assert Content-Type header is form-urlencoded.
      //   - Assert body['username'] equals the email.
    });

    test('saves both tokens on a 200 response', () async {
      // TODO 2.6:
      //   - Stub client.post to return a 200 with both tokens in the body.
      //   - Call auth.login(...).
      //   - verify(() => storage.write(key: 'access_token', value: 'xxx'))
      //     .called(1);
      //   - Same for refresh_token.
    });

    test('throws AuthException on 401 with the standard message', () async {
      // TODO 2.7:
      //   - Stub client.post to return Response('Unauthorized', 401).
      //   - expectLater(auth.login(...), throwsA(isA<AuthException>()...));
      //   - Also verify NO tokens were saved (verifyNever).
    });
  });

  group('AuthService.register', () {
    test('sends JSON body and returns on 201', () async {
      // TODO 2.8: stub a 201, call register(), capture the request,
      // decode the body as JSON, assert email/username/password are present.
    });
  });

  group('AuthService.deleteTokens (logout)', () {
    test('deletes both keys from secure storage', () async {
      // TODO 2.9: stub storage.delete, call auth.deleteTokens(),
      // verify both keys were deleted exactly once.
    });
  });
}
