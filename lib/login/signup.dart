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
  var formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) {
                      return "Please Enter Email Address";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);

                    if (!emailValid) {
                      return " Please Enter Vaild Email Format ";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your UserName";
                    }
                    return null;
                  },
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    bool regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value!);
                  },
                  controller: passWordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'PassWord',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Phone";
                    }
                    return null;
                  },
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {},
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
                    if (formKey.currentState!.validate()) {
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
                    }
                  },
                  child: const Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
