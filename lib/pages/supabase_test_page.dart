import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';
import 'dart:convert';

class SupabaseTestPage extends StatefulWidget {
  const SupabaseTestPage({super.key});

  @override
  State<SupabaseTestPage> createState() => _SupabaseTestPageState();
}

class _SupabaseTestPageState extends State<SupabaseTestPage> {
  final List<String> _logs = [];
  bool _running = false;

  @override
  void initState() {
    super.initState();
    _runTests();
  }

  Future<void> _runTests() async {
    setState(() {
      _running = true;
      _logs.clear();
    });

    final client = Supabase.instance.client;

    // Test 1: check currentUser (no network required)
    try {
      _logs.add('Checking auth.currentUser...');
      final user = client.auth.currentUser;
      _logs.add('auth.currentUser -> ${user == null ? 'no user' : 'user id=${user.id}'}');
    } catch (e) {
      _logs.add('auth.currentUser error: $e');
    }

    // Test 2: ping the Supabase health endpoint
    // Replace the base URL below if you use a different project.
    const supabaseBase = 'https://ivnmbrzjltshrfqywwoj.supabase.co';
    try {
      _logs.add('GET $supabaseBase/health');
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse('$supabaseBase/health'));
      final response = await request.close();
      final body = await response.transform(const Utf8Decoder()).join();
      _logs.add('health status: ${response.statusCode}');
      final trimmed = body.length > 200 ? '${body.substring(0, 200)}...' : body;
      _logs.add('health body (trimmed): $trimmed');
    } catch (e) {
      _logs.add('health ping error: $e');
    }

    setState(() {
      _running = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supabase Connectivity Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Run tests'),
              onPressed: _running ? null : _runTests,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _logs.isEmpty
                    ? const Center(child: Text('No logs yet'))
                    : ListView.builder(
                        itemCount: _logs.length,
                        itemBuilder: (context, i) => Text(_logs[i]),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
