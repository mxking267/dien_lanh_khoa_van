import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const PasswordInputField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true; // Trạng thái ẩn/hiện password

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: TextInputType.text,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // Đổi trạng thái ẩn/hiện
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
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