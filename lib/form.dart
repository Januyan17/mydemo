import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _mobileNumber = '';
  String _password = '';
  String _confirmPassword = '';

  int? _mobile;

  void _SubmitForm() {
    final valid = _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Email Validation

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }

                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                            return 'Enter Valid Email Address';
                          }

                          return null;
                        },
                        onChanged: (value) => _userEmail = value,
                      ),

                      //User Name Validation

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          if (value.length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }

                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),

                      //Mobile Number Validation

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }

                          if (value.length < 10) {
                            return 'Invalid Mobile Number';
                          }

                          return null;
                        },
                        onChanged: (value) => _mobileNumber = value,
                      ),

                      //Password validation

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }

                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),

                      //conform password validation

                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }

                          if (value != _password) {
                            return 'Password Not Matched';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmPassword = value,
                      ),

                      SizedBox(height: 30),

                      Container(
                          alignment: Alignment.center,
                          child: OutlinedButton(
                              onPressed: _SubmitForm,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.blue),
                              )))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
