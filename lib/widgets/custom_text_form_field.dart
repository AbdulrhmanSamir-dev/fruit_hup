import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key, this.onChanged,this.hintText});
   Function(String)? onChanged;
String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey[300],
      hintText: hintText ?? '',
      hintStyle: TextStyle(color: Colors.grey[700]),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffF3F1F1)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffF3F1F1)),
      ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF3F1F1)),
        ),
    ),
    );
  }
}
