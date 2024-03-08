import 'package:flutter/material.dart';
import 'package:uber_clone_user_app/authentication/login_screen.dart';
import 'package:uber_clone_user_app/methods/common_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIsInternetAvailable() {
    cMethods.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const Text(
                "Sign Up Here",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User E-mail",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),

                    /* TextField(
                        controller: phoneNumberTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "User Phone Number",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ), */
                    TextField(
                      controller: phoneNumberTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "User Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        prefixText: "+880 ", // Add the desired prefix
                        prefixStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkIsInternetAvailable();
                        checkInfoValidation();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          )),
                      child: const Text("Sign Up"),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const LogInScreen()));
                },
                child: const Text(
                  "Already have an account? Login Here",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkInfoValidation() {
    // ignore: prefer_interpolation_to_compose_strings
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar("Username must be 4 letter", context);
    }
    else if(!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(emailTextEditingController.text.trim())){
      cMethods.displaySnackBar("Enter valid email address", context);
    }
    else if(phoneNumberTextEditingController.text.trim().length < 10) {
      cMethods.displaySnackBar("Phone number must be 11 digit", context);
    }
    else if(passwordTextEditingController.text.trim().length < 5){
      cMethods.displaySnackBar("Password must be 6 characters", context);
    }
    else if(!passwordTextEditingController.text.trim().contains(RegExp(r'[A-Z]'))){
      cMethods.displaySnackBar("Must use Uppercase", context);
    }
    else if(!passwordTextEditingController.text.trim().contains(RegExp(r'[a-z]'))){
      cMethods.displaySnackBar("Must use Lowercase", context);
    }
    else if(!passwordTextEditingController.text.trim().contains(RegExp(r'[0-9]'))){
      cMethods.displaySnackBar("Must use Digit", context);
    }
    else if(!passwordTextEditingController.text.trim().contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))){
      cMethods.displaySnackBar("Must use Special Character", context);
    }
  }
}