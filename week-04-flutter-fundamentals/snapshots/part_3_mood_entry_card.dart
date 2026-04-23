import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget — no changes needed.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

// ============================================================================
// Data Model
// ============================================================================

class MoodEntry {
  final int score;
  final String note;
  final DateTime createdAt;

  MoodEntry({required this.score, required this.note})
      : createdAt = DateTime.now();

  String get emoji {
    if (score <= 2) return '😢';
    if (score <= 4) return '😕';
    if (score <= 6) return '😐';
    if (score <= 8) return '😊';
    return '🤩';
  }

  String get formattedDate {
    return '${createdAt.year}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')} '
        '${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}';
  }
}

// ============================================================================
// PART 3: MoodEntryCard (StatelessWidget) — DONE
// ============================================================================

class MoodEntryCard extends StatelessWidget {
  final MoodEntry entry;
  const MoodEntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(entry.emoji, style: const TextStyle(fontSize: 32)),
        title: Text('Score: ${entry.score}/10'),
        subtitle: Text(entry.note),
        trailing: Text(
          entry.formattedDate,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}

// ============================================================================
// PART 4: MoodInputForm (StatefulWidget) — not yet implemented
// ============================================================================

class MoodInputForm extends StatefulWidget {
  final void Function(int score, String note) onSubmit;
  const MoodInputForm({super.key, required this.onSubmit});

  @override
  State<MoodInputForm> createState() => _MoodInputFormState();
}

class _MoodInputFormState extends State<MoodInputForm> {
  @override
  Widget build(BuildContext context) {
    // TODO Part 4: Replace with Slider + TextField + Button
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('MoodInputForm — implement me!'),
    );
  }
}

// ============================================================================
// HomeScreen — showing hardcoded MoodEntryCard widgets to verify Part 3
// ============================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MoodEntryCard(entry: MoodEntry(score: 8, note: 'Great day at AGH!')),
            MoodEntryCard(entry: MoodEntry(score: 5, note: 'Average lecture')),
            MoodEntryCard(entry: MoodEntry(score: 3, note: 'Missed the bus')),
          ],
        ),
      ),
    );
  }
}
