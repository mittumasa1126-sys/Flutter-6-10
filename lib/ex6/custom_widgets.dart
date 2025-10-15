// Importing Flutter's Material library
// It gives access to basic UI widgets like Card, Text, CircleAvatar, Padding, etc.
import 'package:flutter/material.dart';

// ==============================
// 🔷 1. CUSTOM CARD WIDGET
// ==============================

// A StatelessWidget means this widget does not change once created.
// It only displays data given to it through constructor parameters.
class CustomCard extends StatelessWidget {
  // Properties (variables) that hold the title and subtitle values.
  // 'final' means they cannot be changed after creation.
  final String title;
  final String? subtitle; // '?' means it can be null (optional).

  // Constructor — lets us pass title and subtitle when creating CustomCard.
  // Example: CustomCard(title: "Hello", subtitle: "This is a subtitle")
  const CustomCard({
    super.key,
    required this.title, // 'required' makes sure title must be provided.
    this.subtitle, // subtitle is optional.
  });

  @override
  Widget build(BuildContext context) {
    // The build() method describes what this widget looks like.
    return Card(
      margin: const EdgeInsets.all(12), // Space around the card
      child: Padding(
        padding: const EdgeInsets.all(16), // Space inside the card
        child: Column(
          // Align all items (text widgets) to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main title text — large and styled using the app's theme
            Text(title, style: Theme.of(context).textTheme.titleLarge),

            // This 'if' condition checks if subtitle exists.
            // If subtitle is not null, show extra space + subtitle text.
            if (subtitle != null) ...[
              const SizedBox(height: 8), // small space between texts
              Text(subtitle!), // '!' means we’re sure it’s not null here.
            ],
          ],
        ),
      ),
    );
  }
}

// ==============================
// 🔷 2. CUSTOM AVATAR WIDGET
// ==============================

// This widget creates a circular avatar (like a profile picture)
// showing the person’s initials inside (e.g., "John Doe" → "JD").
class CustomAvatar extends StatelessWidget {
  final String name; // Name used to generate initials
  final double size; // Size of the avatar circle

  // Constructor with a default size = 48 if not provided.
  const CustomAvatar({super.key, required this.name, this.size = 48});

  @override
  Widget build(BuildContext context) {
    // Generate initials from the given name
    final initials = name.trim().isEmpty
        ? '?' // If name is empty, show '?'
        : name
              .trim() // Remove spaces from start and end
              .split(RegExp(r"\s+")) // Split name into words (on spaces)
              .where((s) => s.isNotEmpty) // Ignore empty parts
              .map((s) => s[0]) // Take first letter of each word
              .take(2) // Keep only first 2 letters (e.g., John Doe → JD)
              .join(); // Combine them into one string

    // CircleAvatar is a ready-made widget that draws a circle
    // You can display text or an image inside it.
    return CircleAvatar(
      radius: size / 2, // The size of the circle
      child: Text(
        initials, // Show initials inside the circle
        style: TextStyle(
          fontSize: size / 2.6, // Make text scale with avatar size
          fontWeight: FontWeight.bold, // Make initials bold
        ),
      ),
    );
  }
}
