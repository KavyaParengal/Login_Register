import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utilities/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  // final IconData prefixIcon;
  final bool obscureText;
  final Function(String?)? validator;
  final Function()? onSuffixIconPressed;
  final bool showSuffixIcon;
  final TextInputType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    // required this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.TextInputType,
    this.onSuffixIconPressed,
    this.showSuffixIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // prefixIcon: Icon(prefixIcon, color: primary),
          hintText: hintText,
          hintStyle: GoogleFonts.headlandOne(),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: showSuffixIcon
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: primary,
            ),
            onPressed: onSuffixIconPressed,
          )
              : null,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          return validator != null ? validator!(value) : null;
        },
      ),
    );
  }
}