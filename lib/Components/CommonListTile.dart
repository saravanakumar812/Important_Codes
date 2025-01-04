import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CommonListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final ImageIcon leadingIcon; // ImageIcon for custom image-based icons
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const CommonListTile({
    Key? key,
    required this.title,
    this.subtitle,
    required this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon, // Directly use the ImageIcon here
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle!,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
      )
          : null,
      trailing: trailingIcon != null
          ? Icon(
        trailingIcon,
        size: 20,
        color: Colors.black54,
      )
          : null,
      onTap: onTap,
    );
  }
}

