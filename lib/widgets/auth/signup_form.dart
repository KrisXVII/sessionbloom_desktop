import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/extensions/extensions.dart';
import 'package:sessionbloom_desktop/widgets/error_banner.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isLoading;
  final String? errorMessage;
  final String? errorDetail;
  final VoidCallback onSubmit;

  const SignupForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isLoading,
    required this.onSubmit,
    this.errorMessage,
    this.errorDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          const Icon(Icons.queue, size: 40, color: Colors.greenAccent),
          const SizedBox(height: 16),
          Text(
            context.l10n.signUpTitle,
            style: TextStyle(fontSize: 28, fontWeight: .bold),
          ),
          const SizedBox(height: 32),

          if (errorMessage != null)
            ErrorBanner(
              message: errorMessage!,
              details: errorDetail.toString(),
            ),
            const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: context.l10n.formLabel_firstNameLabel,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? context.l10n.required : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: context.l10n.formLabel_lastNameLabel,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? context.l10n.required : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: context.l10n.formLabel_emailLabel,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? context.l10n.required : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: context.l10n.formLabel_passwordLabel,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.key),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? context.l10n.required : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: context.l10n.formLabel_repeatPasswordLabel,
                    border: const OutlineInputBorder(),
                    // prefixIcon: const Icon(Icons.cloud_lock),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? context.l10n.required : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: isLoading ? null : onSubmit,
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(context.l10n.buttons_signUpButton),
          ),
        ],
      ),
    );
  }
}
