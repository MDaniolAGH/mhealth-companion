# Mood Tracker — Week 6 starter

This is the starter project for the Week 6 lab on **state management with Riverpod** in the *Mobile Apps for Healthcare* course.

The UI is already built. You will add the state layer by completing **7 TODOs** across 5 files:

| File | TODO |
|---|---|
| `lib/providers/mood_provider.dart` | 1 — `MoodNotifier` class · 2 — provider definitions |
| `lib/main.dart` | 3 — wrap the app in `ProviderScope` |
| `lib/screens/home_screen.dart` | 4 — watch `moodProvider` |
| `lib/screens/add_mood_screen.dart` | 5 — call `addMood` |
| `lib/screens/mood_detail_screen.dart` | 6 — call `deleteMood` |
| `lib/screens/stats_screen.dart` | 7 — watch `moodStatsProvider` |

Full workbook: [`week-06-state-management/lab/README.md`](../../README.md).
Reference implementation when you get stuck: `../../finished/mood_tracker/`.

## Run

```bash
flutter pub get
flutter run
```
