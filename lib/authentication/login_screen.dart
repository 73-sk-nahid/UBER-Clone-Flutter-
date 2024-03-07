import 'package:flutter/material.dart';
import 'package:uber_clone_user_app/authentication/signup_screen.dart';
import 'package:uber_clone_user_app/methods/common_methods.dart';

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
  void initState() {
    cMethods.checkConnectivity(context);
    super.initState();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png"
                ),
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
                      ),const SizedBox(height: 22,),

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
                      ),const SizedBox(height: 22,),

                      ElevatedButton(
                        onPressed: () 
                        {
                          checkIsInternetAvailable();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding:const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          )
                        ),
                        child: const Text("Log In"),
                        )
                    ],
                  ),
                  ),

                  TextButton(
                    onPressed: () 
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const SignUpScreen()));
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

  void checkIsInternetAvailable() {
    {
      cMethods.checkConnectivity(context);
    }
  }
}