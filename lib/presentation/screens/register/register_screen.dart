import 'package:dien_lanh_khoa_van/presentation/widgets/form_control/phone_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/form_control/password_input_field.dart';
import '../../widgets/form_control/text_input_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _phoneNumber = '';
  String _verificationId = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký')),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Không cho vuốt tay
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          _buildPhonePage(),
          _buildOtpPage(),
          _buildInfoPage(),
        ],
      ),
    );
  }

  // Page 1: Nhập số điện thoại
  Widget _buildPhonePage() {
    TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          PhoneTextField(
            labelText: 'Số điện thoại',
            controller: phoneController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              _phoneNumber = '+84${phoneController.text.substring(1)}'; // Chuyển sang định dạng quốc tế
              await _auth.verifyPhoneNumber(
                phoneNumber: _phoneNumber,
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lỗi: ${e.message}')),
                  );
                },
                codeSent: (String verificationId, int? resendToken) {
                  setState(() {
                    _verificationId = verificationId;
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Gửi OTP'),
          ),
        ],
      ),
    );
  }

  // Page 2: Nhập OTP
  Widget _buildOtpPage() {
    TextEditingController otpController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextInputField(
            labelText: 'Mã OTP',
            hintText: 'Nhập mã 6 chữ số',
            keyboardType: TextInputType.number,
            controller: otpController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: _verificationId,
                  smsCode: otpController.text,
                );
                await _auth.signInWithCredential(credential);
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Mã OTP không đúng')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }

  // Page 3: Nhập thông tin đăng ký
  Widget _buildInfoPage() {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextInputField(
            labelText: 'Họ tên',
            hintText: 'Nhập họ tên',
            controller: nameController,
          ),
          const SizedBox(height: 16),
          TextInputField(
            labelText: 'Email',
            hintText: 'Nhập email',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          const SizedBox(height: 16),
          PasswordInputField(
            labelText: 'Mật khẩu',
            hintText: 'Nhập mật khẩu',
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                User? user = _auth.currentUser;
                await user?.updateProfile(displayName: nameController.text);
                await user?.updateEmail(emailController.text);
                await user?.updatePassword(passwordController.text);
                Navigator.pop(context); // Quay về màn hình đăng nhập
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Lỗi: ${e.toString()}')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Đăng ký'),
          ),
        ],
      ),
    );
  }
}