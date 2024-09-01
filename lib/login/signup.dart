import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/login/login.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "SignUp";

  SignupScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Screen'),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, LoginScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(text: "I have an Accounte?? "),
                TextSpan(
                  text: "Login ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.name,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'UserName',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passWordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'PassWord',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.phone,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  FirebaseFunction.createAccountAuth(
                      emailController.text, passWordController.text,
                      age: int.parse(ageController.text),
                      phone: phoneController.text,
                      userName: userNameController.text, onSuccess: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  }, onError: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(error),
                        actions: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  });
                },
                child: const Text('SignUp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
