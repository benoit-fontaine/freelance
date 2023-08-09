import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType {
  text,
  integer,
  amount,
  email,
  phone,
  
  ;
  
  TextInputType get keyboardType {
    switch (this) {
      case InputType.text:
        return TextInputType.text;
      case InputType.integer:
        return TextInputType.number;
      case InputType.amount:
        return const TextInputType.numberWithOptions(decimal: true);
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.phone:
        return TextInputType.phone;
      
    }
  }
  
  List<TextInputFormatter> get inputFormatters {
    switch (this) {
      case InputType.text:
        return [];
      case InputType.integer:
        return [FilteringTextInputFormatter.digitsOnly];
      case InputType.amount:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ];
      case InputType.email:
        return [];
      case InputType.phone:
        return [FilteringTextInputFormatter.digitsOnly];
      
    }
  }
  
  String? validator(String? value) {
    switch (this) {
      case InputType.text:
        return null;
      case InputType.integer:
        if (value == null || value.isEmpty) return "Veuillez saisir un nombre";
        final number = int.tryParse(value);
        if (number == null) return "Veuillez saisir un nombre";
        return null;
      case InputType.amount:
        if (value == null || value.isEmpty) return "Veuillez saisir un nombre";
        final number = double.tryParse(value);
        if (number == null) return "Veuillez saisir un nombre";
        return null;
      case InputType.email:
        if (value == null || value.isEmpty) return "Veuillez saisir une adresse email";
        if (!RegExp(r"^.+@.+\..+$").hasMatch(value)) return "Veuillez saisir une adresse email valide";
        return null;
      case InputType.phone:
        if (value == null || value.isEmpty) return "Veuillez saisir un numéro de téléphone";
        if (value.length != 10) return "Veuillez saisir un numéro de téléphone valide";
        return null;
      
    }
  }
}

class InputText extends StatefulWidget {
  final InputType type;
  final String label;
  final String initialValue;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const InputText({
    super.key,
    this.type = InputType.text,
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
      inputFormatters: widget.type.inputFormatters,
      keyboardType: widget.type.keyboardType,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      validator: widget.validator ?? widget.type.validator,
      onChanged: widget.onChanged,
    );
  }
}
