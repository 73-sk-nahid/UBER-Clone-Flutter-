import 'package:flutter/material.dart';
import 'package:uber_clone_user_app/authentication/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> 
{
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
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
                      ),const SizedBox(height: 22,),

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

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding:const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          )
                        ),
                        child: const Text("Sign Up"),
                        )
                    ],
                  ),
                  ),

                  TextButton(
                    onPressed: () 
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const LogInScreen()));
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
}