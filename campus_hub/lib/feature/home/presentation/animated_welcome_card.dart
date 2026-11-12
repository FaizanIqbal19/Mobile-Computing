import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';

class AnimatedWelcomeCard extends StatefulWidget {
  const AnimatedWelcomeCard({super.key});

  @override
  State<AnimatedWelcomeCard> createState() => _AnimatedWelcomeCardState();
}

class _AnimatedWelcomeCardState extends State<AnimatedWelcomeCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: EdgeInsets.all(_expanded ? 28 : 22),
        decoration: BoxDecoration(
          gradient: _expanded
              ? null
              : const LinearGradient(
                  colors: [AppTheme.navy, AppTheme.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          color: _expanded ? const Color(0xFF64B6AC) : null,
          borderRadius: BorderRadius.circular(_expanded ? 28 : 24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.waving_hand_rounded,
              color: Color(0xFFFFD166),
              size: 32,
            ),
            const SizedBox(height: 14),
            Text(
              _expanded ? 'Welcome to Campus Hub!' : 'Welcome back!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _expanded
                  ? 'Tap again to return to the compact view.'
                  : 'Stay organized, learn more and achieve your goals.',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
