import 'package:flutter/material.dart';
import '/widgets/home_body.dart';
import '/services/api_health_check.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Map<String, dynamic> _serverData = {};

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    final response = await ApiHealthCheck.testConnection();

    setState(() {
      // _serverData = response;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Text('SessionBloom'),
            Text('Status: ${_serverData["body"] ?? "N/A"}'),
            const SizedBox(width: 8),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (_serverData["code"] == 200) ? Colors.green : Colors.red,
              ),
            ),
          ],
        )
      ),
      body: const HomeBody(),  // ← Even the body is extracted!
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}