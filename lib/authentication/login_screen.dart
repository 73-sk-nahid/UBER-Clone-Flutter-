import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_user_app/authentication/signup_screen.dart';
import 'package:uber_clone_user_app/global/global_var.dart';
import 'package:uber_clone_user_app/methods/common_methods.dart';
import 'package:uber_clone_user_app/pages/home_page.dart';
import 'package:uber_clone_user_app/widgets/loading_dialog.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

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
                "Log In Here",
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
                        cMethods.checkConnectivity(context);
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(emailTextEditingController.text.trim())) {
                          cMethods.displaySnackBar(
                              "Enter valid email address", context);
                        } else if (passwordTextEditingController.text
                                .trim()
                                .length <
                            5) {
                          cMethods.displaySnackBar(
                              "Password must be 6 characters", context);
                        } else if (!passwordTextEditingController.text
                            .trim()
                            .contains(RegExp(r'[A-Z]'))) {
                          cMethods.displaySnackBar(
                              "Must use Uppercase", context);
                        } else if (!passwordTextEditingController.text
                            .trim()
                            .contains(RegExp(r'[a-z]'))) {
                          cMethods.displaySnackBar(
                              "Must use Lowercase", context);
                        } else if (!passwordTextEditingController.text
                            .trim()
                            .contains(RegExp(r'[0-9]'))) {
                          cMethods.displaySnackBar("Must use Digit", context);
                        } else if (!passwordTextEditingController.text
                            .trim()
                            .contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                          cMethods.displaySnackBar(
                              "Must use Special Character", context);
                        } else {
                          checkUserLogIn();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          )),
                      child: const Text("Log In"),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const SignUpScreen()));
                },
                child: const Text(
                  "Don't have any account? Sign Up here",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkUserLogIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const LoadingDialog(messageText: "Logging..."),
    );

    final User? userFirebase = (
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    ).catchError((errorMsg) 
    {
      Navigator.pop(context);
      cMethods.displaySnackBar(errorMsg.toString(), context);
    }))
        .user;

    if (userFirebase != null) {
      DatabaseReference usersRef = FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(userFirebase.uid);
      usersRef.once().then((snap) {
        if (snap.snapshot.value != null) {
          if ((snap.snapshot.value as Map)["blockStatus"] == "no") {
            userName = ((snap.snapshot.value as Map)["name"]);
            Navigator.push(context, MaterialPageRoute(builder: (c) => const HomePage()));
          } else {
            FirebaseAuth.instance.signOut();
            cMethods.displaySnackBar(
                "Account Blocked \nContact Customer Care", context);
          }
        } else {
          FirebaseAuth.instance.signOut();
          cMethods.displaySnackBar("User is not registered", context);
        }
      });
    }

    if (!context.mounted) return;
    Navigator.pop(context);
  }
}
