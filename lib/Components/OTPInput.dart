
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/theme.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController? controller;
  final bool? autoFocus;
  final bool? isNextFocus;

  OtpInput({
    this.controller,
    this.isNextFocus = true,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextField(
        style: TextStyle(
          color: AppTheme.containerBackground,
          fontWeight: FontWeight.w400,
          // fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 14,
        ),
        autofocus: autoFocus!,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.radioButtonColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.radioButtonColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (isNextFocus!) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
      ),
    );
  }
}
