// Week 10 — TODO 5: Golden test for MoodCard.
//
// A golden test = pixel-accurate snapshot.
//
// First run: `flutter test --update-goldens test/widgets/mood_card_golden_test.dart`
//   - Generates the reference PNG at test/widgets/goldens/.
// Subsequent runs: `flutter test test/widgets/mood_card_golden_test.dart`
//   - Compares the new render to the reference. ANY pixel diff fails.
//
// What to write:
//   1. Build a MoodCard with FIXED values (id, score, note, createdAt).
//      Fixed = deterministic = stable golden.
//   2. Wrap it in a MaterialApp with a fixed theme and a SizedBox of
//      known width.
//   3. Use `expectLater(finder, matchesGoldenFile('goldens/...png'))`.
//   4. Add a second golden for the null-note variant.
//
// Why fixed values?
//   DateTime.now() and uuid.v4() change every run — the golden would
//   never match. Hardcode them in the test.
//
// Why wrap in a fixed-width SizedBox?
//   ListTiles expand to fill parent width. Without a fixed width, the
//   render differs by viewport. Predictable size = predictable golden.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mood_tracker/models/mood_entry.dart';
import 'package:mood_tracker/widgets/mood_card.dart';

void main() {
  // TODO 5.1: Define a fixed MoodEntry with id, score, note, and a
  // fixed DateTime (e.g., DateTime(2026, 2, 15, 14, 30)).
  // final fixedEntry = ...

  // TODO 5.2: A `wrap(child)` helper that returns a MaterialApp with
  // useMaterial3: true, a fixed ColorScheme, and a Scaffold containing
  // the child inside a SizedBox(width: 400).

  testWidgets('MoodCard golden — with note', (tester) async {
    // TODO 5.3: pumpWidget(wrap(MoodCard(entry: fixedEntry))),
    // expectLater(find.byType(MoodCard),
    //             matchesGoldenFile('goldens/mood_card_with_note.png'));
  });

  testWidgets('MoodCard golden — null note shows italic placeholder',
      (tester) async {
    // TODO 5.4: Use copyWith(note: null), same pattern, different golden file.
  });
}
