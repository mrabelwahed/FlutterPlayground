import 'package:flutter/material.dart';
import 'package:flutter_playground/screen/shared/components/primary_button.dart';
import 'package:flutter_playground/screen/shared/components/text_form_field.dart';

class LoginScreen extends StatelessWidget {

  var  passwordController = TextEditingController();
  var  emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                 textInput(
                     hint: "Email",
                     prefixIcon: const Icon(Icons.email),
                     hasObscureText: false,
                     keyboardType: TextInputType.emailAddress,
                     controller: emailController,
                   validate: (value) {
                     if(value !=null && value.isEmpty) {
                       return "email can not be empty";
                     }
                     return null;
                   }
                 ),
                  const SizedBox(
                    height: 20,
                  ),
                 textInput(
                     hint: "password",
                     prefixIcon: const Icon(Icons.lock),
                     suffixIcon: const Icon(Icons.visibility),
                     controller: passwordController,
                   validate: (value) {
                     if(value !=null && value.isEmpty) {
                       return "password can not be empty";
                     }
                     return null;
                   }
                 ),
                  const SizedBox(
                    height: 15,
                  ),
                  primaryButton(title: "Login", function: (){
                    if(formKey.currentState!.validate()){
                      print("login btn is clicked");
                      print("${emailController.text}${passwordController.text}");
                    }

                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      TextButton(
                          onPressed: (){},
                          child: const Text("Signup")
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
