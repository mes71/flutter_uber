import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:user_app/data/utils/connectiviy_util.dart';
import 'package:user_app/presentation/ui/utils/utils.dart';
import 'package:user_app/presentation/ui/widgets/snakbar_widget.dart';

//TODO form validation with bloc

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesLogo),
              const Text(
                "Create user\'s account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          hintText: 'username',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'email',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                            hintText: 'password',
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: showPassword
                                  ? const Icon(CupertinoIcons.eye)
                                  : const Icon(CupertinoIcons.eye_slash),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  checkConnectivity().then((hasConnection) {
                    if (hasConnection) {
                    } else {
                      displaySnakeBar(context, 'No internet connection');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(180, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue.shade200,
                ),
                child: const Text('SignUp'),
              ),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //TODO go to login page
                        },
                      text: 'Login',
                      style: const TextStyle(color: Colors.blue),
                    )
                  ]))
            ],
          ),
        ));
  }
}
