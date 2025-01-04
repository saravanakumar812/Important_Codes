import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/theme.dart';

class AppTab extends StatelessWidget {
  final EdgeInsets? margin, padding;
  final bool isSelected;
  final String title;
  final Function() onClick;
  final bool disable;
  final String ImageOne;
  final String ImageTwo;

  const AppTab({
    this.margin,
    this.padding,
    this.isSelected = false,
    this.title = '',
    required this.onClick,
    this.disable = false,
    this.ImageOne = "",
    this.ImageTwo = ""
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !disable,
      child: GestureDetector(
        onTap: () => onClick(),
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          margin: margin ?? EdgeInsets.symmetric(horizontal: 12, vertical: 1),
          decoration: BoxDecoration(
            // color: isSelected ? AppTheme.buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
            gradient: isSelected
                ? LinearGradient(
                    colors: [Color(0xFFF4AD76), Color(0xFFC66711)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            border: Border.all(
              width: 2,
              color: isSelected ? AppTheme.lightCoffeeColor : AppTheme.buttonColor,
            ),
          ),
          height: 35,
          child:  Row(
            children: [
              if (ImageOne.isNotEmpty) Image.asset(ImageOne),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : AppTheme.buttonColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (ImageTwo.isNotEmpty) Image.asset(ImageTwo),
            ],
          ),

        ),
      ),
    );
  }
}
