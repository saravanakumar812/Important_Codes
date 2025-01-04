import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/theme.dart';
// import 'package:untitled/Components/theme.dart';



class Button extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final VoidCallback? onPressed;
  final BorderSide borderColor;

  Button({
    Key? key,
    required this.child,
    this.onPressed,
    this.widthFactor = 0.4,
    this.heightFactor = 0.06,
    this.borderColor = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * heightFactor,
      width: widthFactor != 0 ? screenSize.width * widthFactor : null,
      decoration: BoxDecoration(
          color: AppTheme.buttonColor,
          borderRadius: BorderRadius.circular(25.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.buttonColor,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), side: borderColor)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
class AppButton2 extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final VoidCallback onPressed;
  final Color titleColor;
  final Color color;
  final Color borderColor;
  final FontWeight fontWeight;

  const AppButton2({
    required this.width,
    required this.height,
    required this.title,
    required this.fontSize,
    required this.onPressed,
    required this.titleColor,
    required this.color,
    required this.borderColor,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: titleColor,
          backgroundColor: color,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(

            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final VoidCallback onPressed;
  final Color titleColor;
  final Color color;
  final Color borderColor;
  final FontWeight fontWeight;

  const AppButton({
    required this.width,
    required this.height,
    required this.title,
    required this.fontSize,
    required this.onPressed,
    required this.titleColor,
    required this.color,
    required this.borderColor,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: titleColor,
          backgroundColor: color,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(

            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}