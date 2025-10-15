// Importing Flutter's Material library which contains widgets like Scaffold, AppBar, Buttons, etc.
import 'package:flutter/material.dart';

// Importing files for different experiments
// Each folder (ex6, ex7, etc.) contains separate Dart files for different Flutter topics

// ex6 - Custom Widgets and Themes
import 'ex6/custom_widgets.dart';
import 'ex6/themes.dart';

// ex7 - Form Handling
import 'ex7/form.dart';

// ex8 - Animations
import 'ex8/animations.dart';
import 'ex8/animation_types.dart';

// ex9 - Displaying or Fetching Data (API)
import 'ex9/display_data.dart';

// ex10 - Testing and Debugging
import 'ex10/ui_tests.dart';
import 'ex10/debugging_tools.dart';

// --------------------------- MAIN FUNCTION ---------------------------
// Every Flutter app starts from the 'main()' function.
// runApp() tells Flutter to start the app and show the widget you pass into it.
void main() {
  runApp(const MyApp());
}

// --------------------------- ROOT WIDGET -----------------------------
// MyApp is the root of your entire app.
// StatelessWidget = doesn't change after being built (no user interaction data).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp sets up global settings like theme, title, and which page to show first.
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Removes the "debug" banner in the top-right corner
      title: 'Flutter Experiments Demo', // Title of the app (not visible on screen)
      theme: appTheme, // Theme comes from ex6/themes.dart
      home: const HomePage(), // The first page shown when app starts
    );
  }
}

// --------------------------- HOMEPAGE WIDGET -----------------------------
// This is the main screen that holds all experiment pages.
// It's Stateful because it changes when the user taps on the bottom navigation bar.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// --------------------------- STATE CLASS -----------------------------
// The "_HomePageState" contains all the UI and logic for HomePage.
// State = The part of the widget that can change during the app’s lifetime.
class _HomePageState extends State<HomePage> {
  int _index = 0; // Keeps track of which bottom navigation tab is selected

  @override
  Widget build(BuildContext context) {
    // ------------------- LIST OF PAGES -------------------
    // Each page below corresponds to one experiment (6a, 6b, 7a, etc.)
    // When user clicks a tab at the bottom, we display that page.
    final pages = <Widget>[
      // ------------------- 6a: Custom Widget -------------------
      Padding(
        padding: const EdgeInsets.all(12.0), // Space around content
        child: ListView(
          children: const [
            Text(
              "6a: Custom Widgets",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12), // Adds vertical spacing
            // Using our own custom card widget defined in ex6/custom_widgets.dart
            CustomCard(
              title: 'Custom Card Example',
              subtitle: 'This is 6a experiment',
            ),
          ],
        ),
      ),

      // ------------------- 6b: Themes -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            Text(
              "6b: Themes & Styling",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // Demonstrates how ThemeData is used for consistent app styling
            CustomCard(
              title: 'Themed Card Example',
              subtitle: 'Using ThemeData for styling',
            ),
          ],
        ),
      ),

      // ------------------- 7a: Form design -------------------
      // FormPage contains text fields and buttons (imported from ex7/form.dart)
      const FormPage(),

      // ------------------- 7b: Form validation -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "7b: Form Validation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "Validation messages appear when form fields are invalid",
            ),
          ],
        ),
      ),

      // ------------------- 8a: Fade Animation -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "8a: Fade Animation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // AnimationDemo shows fade-in/fade-out animation
            SizedBox(height: 200, child: AnimationDemo()),
          ],
        ),
      ),

      // ------------------- 8b: Slide + Fade Animation -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "8b: Slide + Fade Animation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // SlideFadeDemo combines sliding and fading animations together
            SizedBox(height: 200, child: SlideFadeDemo()),
          ],
        ),
      ),

      // ------------------- 9a: Fetch Data from API -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "9a: Fetch Data from API",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // ApiPage shows data fetched from an online source (HTTP API)
            SizedBox(height: 400, child: ApiPage()),
          ],
        ),
      ),

      // ------------------- 9b: Display Fetched Data -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "9b: Display Fetched Data",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // Reusing ApiPage widget again to show data UI
            SizedBox(height: 400, child: ApiPage()),
          ],
        ),
      ),

      // ------------------- 10a: Unit Tests -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "10a: Unit Tests for UI Components",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // TestResultsPage shows fake or sample test results for UI components
            SizedBox(height: 300, child: TestResultsPage()),
          ],
        ),
      ),

      // ------------------- 10b: Debugging Tools -------------------
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Text(
              "10b: Debugging Tools",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // DebugPage demonstrates how to use Flutter debugging tools
            SizedBox(height: 200, child: DebugPage()),
          ],
        ),
      ),
    ];

    // ------------------- LABELS FOR EACH EXPERIMENT -------------------
    // These short codes appear on the bottom navigation bar
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

    // ------------------- MAIN PAGE UI -------------------
    return Scaffold(
      // AppBar = top bar with the current experiment label
      appBar: AppBar(title: Text("Experiment ${labels[_index]}")),

      // Body = displays the selected experiment page from the list above
      body: pages[_index],

      // Bottom Navigation Bar = allows user to switch between experiments
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Keeps icons visible
        currentIndex: _index, // Highlights the current tab
        onTap: (i) => setState(() => _index = i),
        // When a tab is tapped, setState() rebuilds the screen with new page
        items: labels
            .map(
              (l) => BottomNavigationBarItem(
                icon: const Icon(Icons.science), // Science beaker icon
                label: l, // Shows the experiment number (like 6a, 7b)
              ),
            )
            .toList(),
      ),
    );
  }
}
