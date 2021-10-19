import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? obscureText;
  final Function(String val)? onChanged;
  final double? height;
  final void Function(String)? onSubmitted;
  final TextInputAction? inputAction;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final Widget? prefix;

  CustomTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.fontSize,
      this.fontWeight,
      this.onChanged,
      this.obscureText,
      this.height = 50,
      this.onSubmitted,
      this.inputAction,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      textInputAction: inputAction,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFE31E24),
        )),
        suffix: suffix,
        prefix: prefix,
        contentPadding: EdgeInsets.all(16.0),
        hintText: hint,
        hintStyle: TextStyle(
          color: Color(0xFF707070),
          fontSize: fontSize,
        ),
      ),
    );
  }
}
