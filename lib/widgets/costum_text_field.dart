import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Widget suffix;
  const CustomTextField({Key key, this.hint, this.suffix}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: widget.hint,
          hintStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              gapPadding: 10,
              borderSide:
                  BorderSide(color: Palette.grey, style: BorderStyle.solid)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 10,
            borderSide: BorderSide(color: Palette.scaffold),
          ),
          suffix: widget.suffix ?? null),
    );
  }
}
