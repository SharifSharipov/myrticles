import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myrticles/cubits/auth/auth_cubit.dart';
import 'package:myrticles/utils/colors/app_colors.dart';
import 'package:myrticles/utils/images/app_images.dart';

import '../../utils/routs/routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthCubit>().checkLoggedState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      builder: (BuildContext context,  state) {
        return Container(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.mytwit),
                Text(
                  "мои статьи",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AuthState state) {
        if (state is AuthUnheticationState) {
          Navigator.pushReplacementNamed(context, RouteNames.authScreen);
        }
        if (state is AuthLoggedState) {
          Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      },
    ));
  }
}
