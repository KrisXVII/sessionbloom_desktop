import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/extensions/extensions.dart';
import 'package:sessionbloom_desktop/screens/auth/code_screen.dart';
import 'package:sessionbloom_desktop/services/auth/auth_service.dart';
import 'package:sessionbloom_desktop/services/api_error.dart';
import 'package:sessionbloom_desktop/widgets/auth/signup_form.dart';
import 'package:sessionbloom_desktop/widgets/layouts/layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _errorDetail;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final _authService = AuthService();

  Future<void> _handleSignup() async {

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = context.l10n.error_details_password_match;
        _errorDetail = {
          "password": [context.l10n.error_message_password_match]
        };
      });
      return;
    }

    final emailExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );

    bool validateEmail(String? value) {
      if (value == null || value.isEmpty) return false;
      if (!emailExp.hasMatch(value.trim())) return false;
      return true;
    }

    if (!validateEmail(_emailController.text.trim())) {
      setState(() {
        _errorMessage = context.l10n.error_message_email_format;
      });
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _errorDetail = null;
    });

    try {
      await _authService.signUp(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Account created!")));
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CodeScreen())
        );
        }
      });
    } on ApiError catch (e) {
      setState(() {
        _errorMessage = e.message;
        _errorDetail = e.details;
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
          padding: const .symmetric(horizontal: 600.0),
          child: SignupForm(
            formKey: _formKey,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            isLoading: _isLoading,
            errorMessage: _errorMessage,
            errorDetail: _errorDetail,
            onSubmit: _handleSignup,
          ),
        ),
      ),
    );
  }
}
