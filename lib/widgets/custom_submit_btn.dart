import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/palette.dart';

class CustomSubmitButton extends StatefulWidget {
  final isCreateAccount;
  void Function() onTap;
  CustomSubmitButton({
    Key key,
    this.onTap,
    this.isCreateAccount,
  }) : super(key: key);

  @override
  State<CustomSubmitButton> createState() => _CustomSubmitButtonState();
}

class _CustomSubmitButtonState extends State<CustomSubmitButton> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? InkWell(
            onHover: ((value) {
              setState(() {
                hovered = value;
              });
            }),
            onTap: widget.onTap,
            child: _btn(hovered: hovered),
          )
        : GestureDetector(
            onTap: widget.onTap,
            child: _btn(hovered: hovered),
          );
  }

  Container _btn({hovered = false}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: hovered
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ]
              : [],
          color: Palette.tyldcYellow,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 12, bottom: 12),
      width: double.infinity,
      child: Center(
          child: Text(
        widget.isCreateAccount ? 'Sign in' : 'Create account',
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w800, fontSize: 20),
      )),
    );
  }
}
