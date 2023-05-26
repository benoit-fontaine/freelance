import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isOnError;
  final bool isPassword;

  const InputText({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isOnError = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = isOnError ? Colors.redAccent : Colors.white30;
    Color iconColor = isOnError ? Colors.redAccent : Colors.blue.shade900;
    Color textColor = isOnError ? Colors.red.shade50 : Colors.white;
    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      height: 40,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
          SizedBox(
            height: 40,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 14, color: textColor, fontWeight: FontWeight.bold),
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: label,
                  hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
