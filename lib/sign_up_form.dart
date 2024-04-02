import 'package:e_commerce_flutter/validators.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool checkboxValue = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  bool isChecked = false;

  RegExp _numeric = RegExp(r"^[0-9]*$");
  RegExp _alphaNumeric = RegExp(r'^[a-zA-Z0-9&%=]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ecommerce Application"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("First Name"),
                        SizedBox(height: 10),
                        TextFormField(
                          key: const ValueKey('First_Name_Key'),
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: "Enter your first name",
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isNotEmpty) {
                                if (value.length < 2) {
                                  return 'Enter at least 2 characters';
                                }
                                if (value.length > 50) {
                                  return 'Max 50 characters are allowed';
                                } else if (_numeric.hasMatch(value)) {
                                  return 'Allow only alpha characters';
                                }
                              }
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Last Name"),
                        SizedBox(height: 10),
                        TextFormField(
                          key: const ValueKey('Last_Name_Key'),
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: "Enter your last name",
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isNotEmpty) {
                                if (value.length < 2) {
                                  return 'Enter at least 2 characters';
                                }
                                if (value.length > 50) {
                                  return 'Max 50 characters are allowed';
                                } else if (_numeric.hasMatch(value)) {
                                  return 'Allow only alpha characters';
                                }
                              }
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Mobile Number "),
                        SizedBox(height: 10),
                        TextFormField(
                          key: const ValueKey('Mobile_No_Key'),
                          controller: _mobileNoController,
                          decoration: InputDecoration(
                            hintText: "Enter your mobile number",
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isNotEmpty) {
                                if (value.length < 10) {
                                  return 'Enter at least 10 characters';
                                }
                                if (value.length > 20) {
                                  return 'Max 20 characters are allowed';
                                }
                                if (!_numeric.hasMatch(value)) {
                                  return 'Allow only numbers';
                                }
                              }
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Email Id"),
                        SizedBox(height: 10),
                        TextFormField(
                            key: const ValueKey('Sign_Up_Email_text_form'),
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Enter your email id",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return errorStrings.error_message_field_required;
                              }

                              if (!emailRegExp.hasMatch(value)) {
                                return errorStrings.error_message_valid_email_id;
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Password"),
                        SizedBox(height: 10),
                        TextFormField(
                            key: const ValueKey('Sign_Up_Password_text_form'),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return errorStrings.error_message_field_required;
                              }

                              if (value.length < 6) {
                                return errorStrings.error_message_password_min_characters;
                              }
                              if (value.length > 10) {
                                return errorStrings.error_message_password_max_characters;
                              }

                              if (!passwordRegExp.hasMatch(value)) {
                                return errorStrings.error_message_valid_password;
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        CheckboxListTile(
                            title: Text('Checkbox Example'),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                  child: Text("Sign Up")),
            )
          ],
        ));
  }
}
