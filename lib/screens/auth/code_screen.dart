import 'package:flutter/material.dart';
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
    _startAuthFlow();
  }

  Future<void> _startAuthFlow() async {
    setState(() => _isLoading = true);
    try {
      final flowId = await _authService.getAuthFlow();
      print(flowId);
      setState(() {
        _flowId = flowId;
      });

    } on ApiError catch (e) {
      setState(() => _errorMessage = e.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleCode() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await _authService.verifyCode(
          flowId: _flowId,
          code: _codeController.text.trim()
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Code sent!")));
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) Navigator.pop(context);
      });
    } on ApiError catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
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
