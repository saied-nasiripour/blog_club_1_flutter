import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.themeData, required this.label,
  });

  final ThemeData themeData;
  final String label;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text(widget.label),
        /*suffix: TextButton(
          style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
              color: widget.themeData.primaryColor,
              fontSize: 14,
            ),
          ),
        ),*/
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
              color: widget.themeData.primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
