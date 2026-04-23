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
// PART 4: MoodInputForm (StatefulWidget) — DONE
// ============================================================================

class MoodInputForm extends StatefulWidget {
  final void Function(int score, String note) onSubmit;
  const MoodInputForm({super.key, required this.onSubmit});

  @override
  State<MoodInputForm> createState() => _MoodInputFormState();
}

class _MoodInputFormState extends State<MoodInputForm> {
  double _score = 5.0;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Score: ${_score.round()}', style: const TextStyle(fontSize: 18)),
          Slider(
            min: 1,
            max: 10,
            divisions: 9,
            value: _score,
            label: _score.round().toString(),
            onChanged: (value) {
              setState(() {
                _score = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              hintText: 'How are you feeling?',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_score.round(), _noteController.text);
            },
            child: const Text('Log Mood'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PART 6: HomeScreen — fully wired
// ============================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MoodEntry> _entries = [];

  void _addEntry(int score, String note) {
    setState(() {
      _entries.insert(0, MoodEntry(score: score, note: note));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          MoodInputForm(onSubmit: _addEntry),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                return MoodEntryCard(entry: _entries[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
