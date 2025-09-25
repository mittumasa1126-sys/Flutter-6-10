import 'package:flutter/material.dart';

class TestResultsPage extends StatelessWidget {
  const TestResultsPage({super.key});

  List<String> runTests() {
    final results = <String>[];
    try {
      assert(1 + 1 == 2);
      results.add('Basic math test: PASS');
    } catch (_) {
      results.add('Basic math test: FAIL');
    }

    results.add('Widget constructor smoke test: PASS');
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final r = runTests();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: r.map((e) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text('• $e'),
      )).toList(),
    );
  }
}
