// Week 10 — TODO 1: Unit tests for the MoodEntry model.
//
// Goal: Test that the model serializes/deserializes correctly.
//
// Why a unit test for a pure data class?
//   Serialization bugs are easy to introduce and devastating in
//   production. A typo in a JSON key silently loses data. Tests pin
//   the contract.
//
// What to write:
//   1. A test that the constructor assigns a UUID when no id is given.
//   2. A test for copyWith() — only the specified field changes.
//   3. A test that toMap() → fromMap() round-trips losslessly.
//   4. A test that toJson() returns ONLY score + note (server assigns
//      id and created_at — sending them would be wrong).
//   5. A test that fromJson() correctly parses the server's int id as
//      a String (the API returns int; our local model uses String).
//
// Hints:
//   - Use the `test()` function for sync logic.
//   - Use `expect(actual, matcher)` for assertions.
//   - Useful matchers: equals(), isA<T>(), isNotEmpty, isNull, contains,
//     greaterThan, isTrue.
//   - For DateTime comparisons, use isAfter() / isBefore() with a
//     small tolerance window — don't use ==.

import 'package:flutter_test/flutter_test.dart';
import 'package:mood_tracker/models/mood_entry.dart';

void main() {
  group('MoodEntry', () {
    // TODO 1.1: Test that constructor assigns a UUID when id is not given.
    //   Hint: create a MoodEntry without id, assert it has a non-empty id.
    test('constructor assigns a UUID when id is not given', () {
      // TODO: write the test
    });

    // TODO 1.2: Test copyWith() — only the specified field changes,
    // everything else is preserved.
    test('copyWith returns a new instance with only specified fields changed',
        () {
      // TODO: create an original MoodEntry with fixed values
      // TODO: call copyWith(score: ...)
      // TODO: assert that score changed and all other fields are identical
    });

    group('SQLite serialization (toMap / fromMap)', () {
      // TODO 1.3: Test that toMap → fromMap round-trips losslessly.
      test('toMap → fromMap round-trips losslessly', () {
        // TODO: create an original MoodEntry, run toMap, then fromMap
        // TODO: assert every field equals the original
      });
    });

    group('API serialization (toJson / fromJson)', () {
      // TODO 1.4: Test that toJson() omits server-assigned fields.
      test('toJson sends only score and note (server assigns id + created_at)',
          () {
        // TODO: create a MoodEntry, call toJson()
        // TODO: assert id and created_at are NOT in the resulting map
        // TODO: assert score and note ARE in the map
      });

      // TODO 1.5: Test fromJson handles int id from the server.
      test('fromJson parses int id from the server (autoincrement PK)', () {
        // TODO: create a Map<String, dynamic> with id as int (e.g., 42)
        // TODO: call MoodEntry.fromJson(...)
        // TODO: assert entry.id is '42' (String, not int)
      });
    });
  });
}
