import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/services/api_health_check.dart';

class AppHeader extends StatefulWidget {
  final String title;

  const AppHeader({super.key, this.title = "SessionBloom"});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isChecking = true;
  bool _isConnected = false;
  String _errorDetails = "";

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  final _connectionService = ApiHealthCheck();

  Future<void> _checkConnection() async {
    setState(() {
      _isChecking = true;
    });

    final connection = await _connectionService.testConnection();

    setState(() {
      _isChecking = false;
      _isConnected = connection.ok;
      _errorDetails = connection.detail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (_isChecking)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (_isConnected)
            const Icon(Icons.done_outline, color: Colors.green, size: 20)
          else
            const Icon(Icons.error_outline, color: Colors.red, size: 20),
          if (!_isChecking && !_isConnected)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                _errorDetails,
                style: const TextStyle(fontSize: 10, color: Colors.red),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
