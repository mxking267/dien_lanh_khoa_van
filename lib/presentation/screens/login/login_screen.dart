import 'package:dien_lanh_khoa_van/presentation/widgets/form_control/password_input_field.dart';
import 'package:dien_lanh_khoa_van/presentation/widgets/form_control/phone_input_field.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _phoneEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(AppConstants.appName, style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28, fontWeight: FontWeight.w700
                )),
                const Text(
                  AppConstants.welcomeBack,
                  style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                PhoneTextField(
                  labelText: AppConstants.phoneOrEmail
                ),
                const SizedBox(height: 16),
                PasswordInputField(
                  labelText: AppConstants.password
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.0, // Giữ nguyên tỷ lệ nhưng loại bỏ padding mặc định
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            side: const BorderSide(color: Colors.grey),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Giảm vùng nhấn
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // Loại bỏ padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4), // Điều chỉnh borderRadius tại đây
                              )
                          ),
                        ),
                        const SizedBox(width: 4), // Giảm gap giữa checkbox và text
                        const Text(AppConstants.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(AppConstants.forgotPassword),
                    ),
                  ],
                ),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Màu nền blue
                  foregroundColor: Colors.white, // Màu chữ white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded 8
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12)
                ),
                child: const Text(AppConstants.login, style: TextStyle(fontSize: 16)),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 0,
                  children: [
                    const Text(AppConstants.noAccount,style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen())
                        );
                      },
                      child: const Text(AppConstants.createAccount),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic
      final phoneEmail = _phoneEmailController.text;
      final password = _passwordController.text;

      // TODO: Implement login functionality
    }
  }
}