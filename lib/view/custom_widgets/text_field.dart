import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextField extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  bool obscureText;

  CustomTextField({required this.hintText, required this.controller, required this.obscureText});
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:GoogleFonts.roboto(
            fontSize: 14.0.sp,
            color: const Color(0xFF646464).withOpacity(0.66),
            fontWeight: FontWeight.w500,
          ),
        enabledBorder:  const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xffFC4F08)
            )
        ),
        focusedBorder:  const UnderlineInputBorder(
            borderSide:  BorderSide(
                color: Color(0xffFC4F08)
            )
        ),
      ),
    );
  }
}
