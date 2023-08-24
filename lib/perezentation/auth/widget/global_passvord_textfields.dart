import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors/app_colors.dart';
class GlobalpasswordTextFilds extends StatefulWidget {
  const GlobalpasswordTextFilds({super.key, required this.controller, required this.labeltext, required this.textInputFormatter});
  final TextEditingController controller;
  final String labeltext;
  final List<TextInputFormatter> textInputFormatter;

  @override
  State<GlobalpasswordTextFilds> createState() => _GlobalpasswordTextFildsState();
}

class _GlobalpasswordTextFildsState extends State<GlobalpasswordTextFilds> {
  bool obscureText=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatter,
      obscureText: obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        labelStyle:  TextStyle(fontWeight: FontWeight.bold,color: AppColors.c_162023,fontSize: 18),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple.shade600,),
        ),
        suffixIcon: IconButton(
          icon: Icon(obscureText
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
