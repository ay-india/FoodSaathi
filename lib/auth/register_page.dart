import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_delivery_app/components/user_auth_input.dart';

import '../components/sign_in_button.dart';
import 'auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    //loading circular style
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
// trying sign in
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        wrongMessage("Password dont match");
      }
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
      //wrong email
      // if (e.code == 'user-not-found')
      //   wrongMessage("Incorrect Mail");

      //wrong password

      // else if (e.code == 'wrong-password') wrongMessage("Incorrect Password");
    }

    // Navigator.pop(context);
  }

  void wrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            // child: ConstrainedBox(
            // constraints: BoxConstraints(
            //   minWidth: MediaQuery.of(context).size.width,
            //   minHeight: MediaQuery.of(context).size.height,
            // ),
            // child: IntrinsicHeight(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //welcome text
                Row(
                  children: [
                    Text(
                      'Create an account for free',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),

                    // Text(
                    //   'we were waiting for you',
                    //   style: TextStyle(
                    //     color: Colors.grey[700],
                    //   ),
                    // ),
                  ],
                ),

                SizedBox(
                  height: 21.h,
                ),
                // Email box
                UserAuthInput(
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController,
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                // password box
                UserAuthInput(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                UserAuthInput(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: confirmPasswordController,
                ),

                SizedBox(
                  height: 24.h,
                ),
                //Signup button
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: InkWell(
                    onTap: signUserUp,
                    child: Container(
                      // color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      // height: 38,
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          22.r,
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                //or sign in with
                SizedBox(
                  height: 39.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.h,
                      ),
                    ),
                    Text(' or Login via '),
                    Expanded(
                      child: Divider(
                        thickness: 1.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                // google and apple authentication
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => AuthService().signInWithGoogle(),
                      child: const SigninButton(
                        image: 'asset/images/google.png',
                        text: 'Sign in with Google',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const SigninButton(
                          image: 'asset/images/apple.png',
                          text: ' Sign in with Apple'),
                    ),
                  ],
                ),

                // not a member
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account,",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onTap,
                        child: Text(
                          'Login here',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // ),
            // ),
          ),
        ),
      ),
    );
  }
}
