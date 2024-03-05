import 'package:dating_vista/core/color/color.dart';
import 'package:flutter/material.dart';

//============================================ElevatedBtn=========================================================

class ElevatedBtnWidget extends StatelessWidget {
  const ElevatedBtnWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.btnColor,
    this.borderColor,
  });
  final void Function()? onPressed;
  final String title;
  final Color? btnColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        backgroundColor: btnColor ?? Colors.transparent,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
    );
  }
}
//==================================================TextFormField====================================================================

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    required this.icon,
    this.suffixicon,
    this.suffixOnpress,
    this.obscurebool = false,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.suffixIconColor,
  });
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final IconData? suffixicon;
  final void Function()? suffixOnpress;
  final void Function(String?)? onChanged;
  final bool obscurebool;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: const TextStyle(color: colorBlack),
      onChanged: onChanged,
      obscureText: obscurebool,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorWhite,
        suffixIcon: IconButton(
          onPressed: suffixOnpress,
          icon: Icon(
            suffixicon,
            color: suffixIconColor,
          ),
        ),
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: colorApp,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      validator: validator,
    );
  }
}
