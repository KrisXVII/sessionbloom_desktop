import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Text(
            '0',  // We'll pass counter as parameter later
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}