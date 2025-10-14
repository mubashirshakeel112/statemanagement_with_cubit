import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final bool isSuffixIconShow;
  final Function()? onSuffixIconPressed;
  final bool filled;
  final Color? fillColor;
  final double? radius;
  final BorderSide? borderSide;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Color? cursorColor;
  final EdgeInsets? margin;

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.filled = true,
    this.fillColor,
    this.radius,
    this.borderSide,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.cursorColor,
    this.onSuffixIconPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? EdgeInsets.zero,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        onChanged: onChanged,
        cursorColor: cursorColor ?? Colors.deepOrange,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
          prefixIcon: prefixIcon,
          suffixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
          suffixIcon: isSuffixIconShow
              ? IconButton(
                  onPressed: onSuffixIconPressed,
                  icon: Icon(suffixIcon, color: Colors.deepOrange),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          filled: filled,
          fillColor: fillColor ?? Colors.deepOrange.withValues(alpha: 0.3),
          enabledBorder: OutlineInputBorder(
            borderSide: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
        ),
      ),
    );
  }
}
