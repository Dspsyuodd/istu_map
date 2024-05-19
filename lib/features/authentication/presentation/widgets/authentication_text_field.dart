import 'package:flutter/material.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField({
    Key? key,
    required this.label,
    this.onChanged,
    this.errorText,
  }) : super(key: key);
  final String label;
  final void Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 65,
          child: TextField(
            onChanged: onChanged,
            autofillHints: const [AutofillHints.email],
            decoration: InputDecoration(
              errorText: errorText,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
