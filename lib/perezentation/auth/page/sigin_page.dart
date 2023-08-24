import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../utils/colors/app_colors.dart';
class SignInpage extends StatefulWidget {
  const SignInpage({super.key});

  @override
  State<SignInpage> createState() => _SignInpageState();
}

class _SignInpageState extends State<SignInpage> {
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  bool obscureText=false;
  var contactFormatter = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(

          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.c_008FE7.withOpacity(0.8),
                    AppColors.c_005589.withOpacity(1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250,left: 150,right: 150),
              child: Text("войти", style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300,left: 24,right: 24),
              child: TextFormField(
                controller: _emailcontroller,
                decoration:  InputDecoration(
                  suffixIcon: const Icon(Icons.check_circle_rounded),
                  labelText: 'Электронная почта',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.c_162023,fontSize: 18),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 360,left: 24,right: 24),
              child: TextFormField(
                obscureText: obscureText,
                inputFormatters: [],
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  labelText: ('Пароль'),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.c_162023,fontSize: 18),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade600),
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
              ),
            ),

          ]
      )
    );
  }
}
