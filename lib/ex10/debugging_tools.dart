import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('DebugPage built at: ${DateTime.now()}');
    return const Center(child: Text('Open the Debug Console to view debugPrint output'));
  }
}
