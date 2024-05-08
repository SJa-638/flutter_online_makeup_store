import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Models/user_model.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFFF00B0),
        centerTitle: true,
        title: Text(
          'Sign in',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(24),
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                validator: (value) {
                    if (value!.isEmpty) {
                      return 'Mandatory field'; // Return this message if the field is empty
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'E-mail invalid'; // Return this message if email format is incorrect
                    }
                    return null; // Return null if validation passes
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Mandatory field'; // Return this message if the field is empty
                    } else if (value!.length < 8) {
                      return 'The password must be at least 8 characters long'; // Return this message if password is too short
                    }
                    // Additional criteria can be added here (e.g., requiring special characters, numbers, etc.)
                    return null; // Return null if validation passes
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,),
                    onPressed: () {
                     if (_emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter your email to recover your password',
                            style: TextStyle(fontSize: 16),
                          ),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else {
                      model.recoverPass(_emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Check your email',
                            style: TextStyle(fontSize: 16),
                          ),
                          backgroundColor: Color(0xFFFF00B0),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                    },
                    child: Text(
                      'I forgot my password',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF00B0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF00B0),
                    ),
                    child: Text(
                      'Sign IN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Failed to sign in, please check if your email and password are correct.',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}