import 'package:flutter/material.dart';
import 'package:social_media_app/utils/app_color.dart';









Widget customTextFromField({
  @required String labelText,
  @required Widget prefixIcon,
  bool isPassword = false,
  IconData suffix,
  @required TextEditingController controller,
  @required Function validator,
  Function suffixPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextFormField(
    
      validator: validator,
      controller: controller,
      style: TextStyle(color: klblack, fontWeight: FontWeight.bold),
      enableInteractiveSelection: false,
      obscureText: isPassword,
      decoration: InputDecoration(
        
        filled: true,
        fillColor: kwhite,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        prefixIcon: prefixIcon,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: kBlue,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kBlue,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kBlue,
            style: BorderStyle.solid,
          ),
        ),
        labelText: labelText,
      ),
    ),
  );
}

