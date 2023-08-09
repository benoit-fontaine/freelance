import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final String initialValue;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const InputText({
    super.key,
    this.label = "",
    this.initialValue = "",
    this.validator,
    this.onChanged,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
