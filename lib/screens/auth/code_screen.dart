import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/screens/home_screen.dart';
import 'package:sessionbloom_desktop/services/auth/auth_service.dart';
import 'package:sessionbloom_desktop/services/api_error.dart';
import 'package:sessionbloom_desktop/widgets/layouts/layout.dart';
import 'package:sessionbloom_desktop/widgets/auth/code_form.dart';

class CodeScreen extends StatefulWidget {
  final String email;

  const CodeScreen({super.key, required this.email});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  String _flowId = "";
  bool _isLoading = false;
  String? _errorMessage;

  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _startVerification();
  }

  Future<void> _startVerification() async {
    setState(() { _isLoading = true; });
    try {
      final flowId = await _authService.getAuthFlow();
      setState(() { _flowId = flowId; });
      await _authService.sendCode(flowId: _flowId, email: widget.email);
    } on ApiError catch (e) {
      setState(() => _errorMessage = e.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleCode() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _errorMessage = null;
    });
    try {
      await _authService.verifyCode(
        flowId: _flowId,
        code: _codeController.text.trim(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Code sent for validation!")),
      );
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      });
    } on ApiError catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Center(
        child: SingleChildScrollView(
          padding: const .symmetric(horizontal: 400),
          child: CodeForm(
            formKey: _formKey,
            codeController: _codeController,
            isLoading: _isLoading,
            errorMessage: _errorMessage,
            email: widget.email,
            onSubmit: _handleCode,
          ),
        ),
      ),
    );
  }
}
