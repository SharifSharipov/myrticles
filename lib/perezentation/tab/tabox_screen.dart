import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myrticles/cubits/tab_cubit/tab_cubit.dart';
import 'package:myrticles/perezentation/tab/tab_screens/email_screen/email_screen.dart';
import 'package:myrticles/perezentation/tab/tab_screens/homescreen/home_screen.dart';
import 'package:myrticles/perezentation/tab/tab_screens/notification_screen/notification_screen.dart';
import 'package:myrticles/perezentation/tab/tab_screens/search_screen/search_screen.dart';
import 'package:myrticles/utils/images/app_images.dart';

import '../../cubits/auth/tabox_cubit.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppImages.home,
      ),
      label: ""),
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppImages.search,
      ),
      label: ""),
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppImages.notification,
      ),
      label: ""),
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppImages.gmail,
      ),
      label: ""),
];
const List<Widget> bottomNawScreen = [
  HomeScreen(),
  SearchScreen(),
  NotificationScreen(),
  EmailScreen(),
];

class Tabbox extends StatelessWidget {
  const Tabbox({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, int>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: bottomNawScreen.elementAt(state),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: context.watch<TabCubit>().state,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: (index) {
                BlocProvider.of<NavbarCubit>(context).updateScreen(index);
              },
            ),
          );
        });
  }
}
