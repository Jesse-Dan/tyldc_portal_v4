import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

import '../config/palette.dart';

class FormsWidget extends StatefulWidget {
  final Widget form;
  const FormsWidget({Key key, this.form});

  @override
  State<FormsWidget> createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Responsive.isDesktop(context)
        ? Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 10,
                left: screenSize.width / 3,
                bottom: screenSize.height / 10,
                right: screenSize.width / 3,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: widget.form,
              ),
            ),
          )
        : Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 15,
                left: screenSize.width / 9,
                bottom: screenSize.height / 15,
                right: screenSize.width / 9,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: widget.form,
              ),
            ),
          );
  }
}
