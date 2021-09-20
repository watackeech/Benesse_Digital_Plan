import 'package:flutter/material.dart';
import 'package:digital_plan_test/palette.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.icon,
    required this.hint,
    required this.placeholder,
    required this.bgcolor,
    required this.inputType,
    required this.inputAction,
    required this.onChanged,
  });

  final String placeholder;
  final IconData icon;
  final String hint;
  final bgcolor;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: bgcolor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kPrime,
                ),
              ),
              hintText: hint,
              hintStyle: kInputStyle,
            ),
            style: kInputStyle,
            keyboardType: inputType,
            textInputAction: inputAction,
            onChanged: onChanged,

            // placeholderが空欄なら、設定なし
            controller: placeholder == "" ? null
                        : TextEditingController(text: placeholder)
          ),
        ),
      ),
    );
  }
}