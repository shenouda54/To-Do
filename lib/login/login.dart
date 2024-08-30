import 'package:flutter/material.dart';
import 'package:todo/login/signup.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, SignupScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text.rich(
            textAlign:TextAlign.center,
            TextSpan(children: [
            TextSpan(text:  "Dont't have an Account ?? "),
            TextSpan(text:  "SignUp ",style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),),
          ],),),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
