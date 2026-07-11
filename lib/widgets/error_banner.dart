import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  final String message;
  final String? details;

  const ErrorBanner({super.key, required this.message, this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const .all(20),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              message,
              textAlign: .center,
              style: const TextStyle(color: Colors.red, fontWeight: .bold),
            ),
            if (details != null) _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Text(
          details!,
          style: const TextStyle(color: Colors.red, fontWeight: .normal),
        ),
      ],
    );
  }
}
