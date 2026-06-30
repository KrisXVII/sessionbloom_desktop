import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sessionbloom_desktop/extensions/extensions.dart';
import 'package:sessionbloom_desktop/widgets/error_banner.dart';

class CodeForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController codeController;
  final String? errorMessage;
  final bool isLoading;
  final String email;
  final VoidCallback onSubmit;


  const CodeForm({
    super.key,
    required this.formKey,
    required this.codeController,
    required this.isLoading,
    required this.onSubmit,
    required this.email,
    this.errorMessage
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          if (errorMessage != null)
            ErrorBanner(
              message: errorMessage!,
            ),
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: .center,
            children: [
              Column(
                crossAxisAlignment: .center,
                children: [
                  Text(
                      "We sent an email to $email",
                    style: TextStyle(fontSize: 26, fontWeight: .w300),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: Pinput(
                  controller: codeController,
                  length: 6,
                  // decoration: InputDecoration(
                  //   labelText: context.l10n.formLabel_code,
                  //   border: const OutlineInputBorder(),
                  //   // prefixIcon: const Icon(Icons.person_outline),
                  // ),
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
                : Text(context.l10n.buttons_sendCode),
          ),
        ],
      )
    );
  }
}
