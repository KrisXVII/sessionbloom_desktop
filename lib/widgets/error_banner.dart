import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  final String message;
  final Map<String, dynamic>? details;

  const ErrorBanner({
    super.key,
    required this.message,
    this.details
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const .all(20),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.red, fontWeight: .bold),
            ),
            if (details != null) ..._buildDetails(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDetails() {

    return details!.entries.expand((entry) {
      final field = entry.key;
      final errors = entry.value as List<dynamic>;
      return errors.map((e) => Text(
        "$field: $e",
        style: const TextStyle(color: Colors.red, fontWeight: .normal),
      ));
    }).toList();
  }
}


