import 'package:flutter/material.dart';

// ex6
import 'ex6/custom_widgets.dart';
import 'ex6/themes.dart';

// ex7
import 'ex7/form.dart';

// ex8
import 'ex8/animations.dart';
import 'ex8/animation_types.dart';

// ex9
import 'ex9/display_data.dart';
import 'ex9/fetch_data.dart';

// ex10
import 'ex10/ui_tests.dart';
import 'ex10/debugging_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Experiments Demo',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // List of all experiments
    final pages = <Widget>[
      // 6a: Custom Widget
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            Text(
              "6a: Custom Widgets",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            CustomCard(
              title: 'Custom Card Example',
              subtitle: 'This is 6a experiment',
            ),
          ],
        ),
      ),

      // 6b: Themes
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            Text(
              "6b: Themes & Styling",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            CustomCard(
              title: 'Themed Card Example',
              subtitle: 'Using ThemeData for styling',
            ),
          ],
        ),
      ),

      // 7a: Form design
      const FormPage(), // Already has labels inside form page
      // 7b: Form validation & error handling
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "7b: Form Validation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text("Validation messages appear when form fields are invalid"),
          ],
        ),
      ),

      // 8a: Fade animation
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "8a: Fade Animation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 200, child: AnimationDemo()),
          ],
        ),
      ),

      // 8b: Slide + Fade animation
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "8b: Slide + Fade Animation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 200, child: SlideFadeDemo()),
          ],
        ),
      ),

      // 9a: Fetch data from API
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "9a: Fetch Data from API",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 400, child: ApiPage()),
          ],
        ),
      ),

      // 9b: Display data in UI
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "9b: Display Fetched Data",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 400, child: ApiPage()), // Reusing the same widget
          ],
        ),
      ),

      // 10a: Unit tests for UI
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "10a: Unit Tests for UI Components",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 300, child: TestResultsPage()),
          ],
        ),
      ),

      // 10b: Debugging tools
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "10b: Debugging Tools",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(height: 200, child: DebugPage()),
          ],
        ),
      ),
    ];

    final labels = [
      '6a',
      '6b',
      '7a',
      '7b',
      '8a',
      '8b',
      '9a',
      '9b',
      '10a',
      '10b',
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Experiment ${labels[_index]}")),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: labels
            .map(
              (l) => BottomNavigationBarItem(
                icon: const Icon(Icons.science),
                label: l,
              ),
            )
            .toList(),
      ),
    );
  }
}
