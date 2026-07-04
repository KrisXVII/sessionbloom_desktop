import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            children: [
              const Text('SessionBloom'),
              Text('OOOOOSNAF'),
              const SizedBox(width: 8),
            ],
          )
      ),
    );
  }
}
