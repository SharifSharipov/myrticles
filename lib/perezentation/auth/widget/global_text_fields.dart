import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors/app_colors.dart';

class GlobalTextFilds extends StatelessWidget {
  const GlobalTextFilds(
      {super.key, required this.controllerl, required this.labeltext, required this.textInputFormatter});
  final TextEditingController controllerl;
  final String labeltext;
  final List<TextInputFormatter> textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: textInputFormatter,
      controller: controllerl,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        suffixIcon: const Icon(Icons.check_circle_rounded),
        labelText: labeltext,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.c_162023,
            fontSize: 18),
      ),
    );
  }
}
