import 'dart:math' as math;

import 'package:dien_lanh_khoa_van/main_screen.dart';
import 'package:dien_lanh_khoa_van/presentation/screens/login/widgets/wave_painter.dart';
import 'package:dien_lanh_khoa_van/presentation/widgets/form_control/password_input_field.dart';
import 'package:dien_lanh_khoa_van/presentation/widgets/form_control/phone_input_field.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 200,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Wave Header
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        SizedBox(
                          height: 200,
                          child: ClipRect(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationX(math.pi),
                              child: CustomPaint(
                                painter: WavePainter(),
                                size: Size(MediaQuery.of(context).size.width, 250),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(AppConstants.appName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700)),
                              const Text(
                                AppConstants.welcomeBack,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Form Content (Centered)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 8),
                                PhoneTextField(
                                    labelText: AppConstants.phoneOrEmail),
                                const SizedBox(height: 8),
                                PasswordInputField(
                                    labelText: AppConstants.password),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.0,
                                          child: Checkbox(
                                              value: _rememberMe,
                                              onChanged: (value) {
                                                setState(() {
                                                  _rememberMe = value ?? false;
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: ThemeColors.primary,
                                              side: const BorderSide(color: Colors.grey),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4),
                                              )),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(AppConstants.rememberMe),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Handle forgot password
                                      },
                                      child: const Text(AppConstants.forgotPassword, style: TextStyle(color: ThemeColors.primary)),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColors.primary,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 14)),
                                  child: const Text(AppConstants.login,
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(AppConstants.noAccount,
                                        style: TextStyle(color: Colors.grey)),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));
                                      },
                                      child: const Text(AppConstants.createAccount, style: TextStyle(color: ThemeColors.primary)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic
      final phoneEmail = _phoneEmailController.text;
      final password = _passwordController.text;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainScreen()));

      // TODO: Implement login functionality
    }
  }
}