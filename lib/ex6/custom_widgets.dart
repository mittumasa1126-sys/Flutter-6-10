import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomCard({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(subtitle!),
            ]
          ],
        ),
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  final String name;
  final double size;

  const CustomAvatar({super.key, required this.name, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final initials = name.trim().isEmpty
        ? '?'
        : name
            .trim()
            .split(RegExp(r"\s+"))
            .where((s) => s.isNotEmpty)
            .map((s) => s[0])
            .take(2)
            .join();

    return CircleAvatar(
      radius: size / 2,
      child: Text(initials,
          style: TextStyle(fontSize: size / 2.6, fontWeight: FontWeight.bold)),
    );
  }
}
