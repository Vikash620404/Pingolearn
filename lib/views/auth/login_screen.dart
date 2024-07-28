
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mypingolearnproject/views/auth/signup_screen.dart';

import '../../common_custom/const_color.dart';
import '../../common_custom/const_text_style.dart';
import 'custom/custom_elevation_button.dart';
import 'custom/custom_form.dart';

// Import custom ElevatedButton

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();

}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //TextEditingController email=TextEditingController();


  sigIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  final NavigationService _navigationService = NavigationService();
    return Scaffold(

      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                        'MyNews',
                        style:AppTextStyles.heading1

                    ),
                  ],
                ),
                SizedBox(height: 190),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      CustomTextFormField(
                        controller: _emailController,
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _passwordController,
                        label: 'Password',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 150),
                      CustomElevatedButton(
                        text: 'Login',
                        onPressed: (){
                         sigIn();
                      //    _navigationService.navigateTo(RouteNames.signup);
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),

                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          text: 'New here? ',
                          style: AppTextStyles.heading4,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                color: AppColors.blueColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to SignInScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
