import 'package:flutter/material.dart';
import './validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('Login_email_text_form'),
                validator: emailValidator,
              ),
              TextFormField(
                key: const ValueKey('Login_password_text_form'),
                validator: passwordValidator,
              ),
              ElevatedButton(
                  onPressed: () {
                    _key.currentState?.validate();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
