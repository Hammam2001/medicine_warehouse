import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/global/app_text-form_filed.dart';


class Register extends StatelessWidget {
   Register({super.key});
  TextEditingController? phoneController;
  TextEditingController ? passwordController;
  TextEditingController? firstNameController;
  TextEditingController ?lastNameController;
  TextEditingController ?confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register',),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFiledApp(
                controller: firstNameController,
                type: TextInputType.name,
                label: 'First Name',
                obscurePassword: false,
                prefix: Icons.abc,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFiledApp(
                controller: lastNameController,
                type: TextInputType.name,
                label: 'Last Name',
                obscurePassword: false,
                prefix: Icons.abc,

              ),
              const SizedBox(
                height: 20,
              ),
              TextFiledApp(
                controller: phoneController ,
                type: TextInputType.name,
                label: 'Phone',
                obscurePassword: false,
                prefix: Icons.numbers,
              ),
              const SizedBox(
                height: 20,
              ),

              TextFiledApp(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                prefix: Icons.lock,
                label: 'Password',
                obscurePassword: true,
                suffix: Icons.remove_red_eye_sharp,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFiledApp(
                controller: confirmPasswordController,
                type: TextInputType.visiblePassword,
                prefix: Icons.lock,
                label: 'Confirm Password',
                obscurePassword: true,
                suffix: Icons.remove_red_eye_sharp,
              ),

              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.orangeAccent,
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
