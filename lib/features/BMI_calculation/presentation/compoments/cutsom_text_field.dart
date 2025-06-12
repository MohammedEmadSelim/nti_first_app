import 'package:flutter/material.dart';
import 'package:nti_first_app/core/theme/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
      MediaQuery.of(context).size.width, // Adjust width as needed
      height: 48, // Approximate height from your image
      decoration: BoxDecoration(
        color: Color(0xFFF5F8FF),
        // background color from the image
        borderRadius: BorderRadius.circular(8),
        // smooth rounded corners
        // Optional subtle shadow like in the image:
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextFormField(

        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF5F8FF) ,
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),borderSide: BorderSide(
          //   color: Colors.transparent
          // )),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),borderSide: BorderSide(
          //     color: Colors.transparent
          // )) ,
          // disabledBorder:  OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),borderSide: BorderSide(
          //     color: Colors.transparent
          // )),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none, // removes default underline
          hintText: 'Enter text',
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}
