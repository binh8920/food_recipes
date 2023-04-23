import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homerecipes/presentation/theme/color.dart';
import 'package:homerecipes/presentation/screens/bookmark/saved_screen.dart';
import 'package:homerecipes/presentation/screens/explore/explore_screen.dart';
import 'package:homerecipes/presentation/screens/home/home_screen.dart';

class HomeRecipes extends StatefulWidget {
  const HomeRecipes({Key? key}) : super(key: key);

  @override
  State<HomeRecipes> createState() => _HomeState();
}

class _HomeState extends State<HomeRecipes> {
  int index = 1;

  void select(int page) {
    setState(() {
      index = page;
    });
  }

  List<Widget> pages = [const Explore(), const HomeScreen(), const Bookmark()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: select,
          selectedItemColor: primary,
          unselectedItemColor: inActiveColor,
          selectedIconTheme: const IconThemeData(color: primary),
          backgroundColor: bottomBarColor,
          items: [
            BottomNavigationBarItem(
                label: "Explore",
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 18.sp,
                  width: 18.sp,
                )),
            BottomNavigationBarItem(
                label: "Home",
                icon: SvgPicture.asset("assets/icons/home.svg",
                    height: 18.sp, width: 18.sp)),
            BottomNavigationBarItem(
                label: "My recipes",
                icon: SvgPicture.asset("assets/icons/bookmark.svg",
                    height: 18.sp, width: 18.sp)),
          ]),
    );
  }
}
