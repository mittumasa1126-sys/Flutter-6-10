import 'package:flutter/material.dart';

class SlideFadeDemo extends StatefulWidget {
  const SlideFadeDemo({super.key});

  @override
  State<SlideFadeDemo> createState() => _SlideFadeDemoState();
}

class _SlideFadeDemoState extends State<SlideFadeDemo>
    with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut)),
        child: FadeTransition(
          opacity: _fadeController,
          child: const FlutterLogo(size: 120),
        ),
      ),
    );
  }
}
