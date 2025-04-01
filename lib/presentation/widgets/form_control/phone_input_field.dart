import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;

  const PhoneTextField({
    super.key,
    this.controller,
    this.labelText = 'Số điện thoại',
    this.hintText,
    this.onChanged,
    this.validator,
    this.initialValue,
  });

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    final phoneRegExp = RegExp(r'^0[0-9]{9}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label ở ngoài
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4), // Khoảng cách giữa label và input
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
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
          onChanged: onChanged,
          validator: validator ?? _defaultValidator,
        ),
      ],
    );
  }
}