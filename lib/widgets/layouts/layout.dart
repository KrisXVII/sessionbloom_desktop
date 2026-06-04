import 'package:flutter/material.dart';
import 'header.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Expanded(
            child: child,  // whatever screen you pass in goes here
          ),
        ],
      ),
    );
  }
}