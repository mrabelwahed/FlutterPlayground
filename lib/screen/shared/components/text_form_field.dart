import 'package:flutter/material.dart';

Widget textInput({
  required String hint,
  required TextEditingController controller,
  TextInputType keyboardType =  TextInputType.text,
  required Widget prefixIcon,
  Widget? suffixIcon,
  bool hasObscureText =  true,
  required FormFieldValidator<String>?  validate
  }) => TextFormField(
   decoration: InputDecoration(
   labelText: hint,
   prefixIcon: prefixIcon,
   suffixIcon: suffixIcon,
   border: OutlineInputBorder(),),
   obscureText: hasObscureText,
   controller:  controller,
   validator: validate,
);