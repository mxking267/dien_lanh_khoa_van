import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder( // Thêm enabledBorder
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}