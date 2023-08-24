import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myrticles/cubits/auth/auth_cubit.dart';
import 'package:myrticles/perezentation/auth/page/sigin_page.dart';
import 'package:myrticles/perezentation/auth/page/sign_up.dart';
import 'package:myrticles/perezentation/auth/widget/button.dart';
import '../../data/models/user_model/user_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/routs/routs.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return Stack(
          children: [
            isScreen ? SignUppage() : SignInpage(),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: isScreen ? 715 : 500, left: 24),
                  child: Text(
                    isScreen ? "уже есть аккаунт ?" : "еще нет аккаунта? ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.c_162023),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: isScreen ? 715 : 500),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          isScreen = !isScreen;
                        });
                      },
                      child: Text(
                        isScreen ? "зарегистрируйтесь" : "Регистрация",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.c_C93545),
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: isScreen ? 650 : 440, left: 24, right: 24),
              child: GLobalButton(
                onPressed: () {

                  if (context.read<AuthCubit>().state is AuthLoggedState) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteNames.tabBox, (route) => false);
                  }
                },
                text: isScreen ? "Регистрация" : "зарегистрируйтесь",
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, AuthState state) {},
    ));
  }
}
