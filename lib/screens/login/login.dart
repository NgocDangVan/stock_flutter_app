import 'package:flutter/material.dart';
import 'package:stock_app/repositories/user_repository.dart';
import 'package:stock_app/screens/commons/utilities.dart';
import 'package:stock_app/screens/home/home.dart';
import 'package:stock_app/validators/EmailValidator.dart';
import 'package:stock_app/validators/PasswordValidator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _login() async {
    // Chắc chắn _formKey.currentState khác null nên để dấu !để không bị lỗi
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        final token = await UserRepository.login(email, password);
        if (token != null) {
          await prefs.setString('token', token);
          await prefs.setBool('isLogginIn', true);
        } else {
          print('Failed to login');
        }
      } catch (e) {
        print('Error: $e');
      }

      if (context.mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } else {
      showMessageDialog(context, 'Login failed', MessageType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                      hintText: 'Enter your email',
                      iconData: Icons.person,
                      controller: _emailController,
                      validator: EmailValidator.validate),
                  const SizedBox(height: 20),
                  _buildTextField(
                      hintText: 'Enter your password',
                      iconData: Icons.person,
                      obscureText: !_showPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            _showPassword = !_showPassword;
                          },
                          icon: _showPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      controller: _passwordController,
                      validator: PasswordValidator.validate),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: _login, child: const Text('Login')),
                      const IconButton(
                          onPressed: null, icon: Icon(Icons.fingerprint)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have a account ?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            print('aaa');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 16),
                          ))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Get smart OTP'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData iconData,
      Function(String)? onChanged,
      Widget? suffixIcon,
      bool obscureText = false,
      required TextEditingController controller,
      String? Function(String?)? validator}) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Icon(iconData),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(hintText: hintText),
            onChanged: onChanged,
            obscureText: obscureText,
            controller: controller,
            validator: validator,
          )),
          if (suffixIcon != null) suffixIcon
        ],
      ),
    );
  }
}
