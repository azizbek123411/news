import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app/config/appcolors.dart';
import 'package:news_app/ui/pages/nav_bar_pages/explore_page.dart';
import 'package:news_app/ui/pages/nav_bar_pages/home_page.dart';
import 'package:news_app/ui/pages/nav_bar_pages/saved_news_page.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  

  List pages = [
    const HomePage(),
    const ExplorePage(),
    const SavedNewsPage(),
  ];
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          pages[initialIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 23,
        backgroundColor: AppColors.navBar,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.greyColor,
        elevation: 0,
        currentIndex: initialIndex,
        onTap: (index) {
          setState(() {
            initialIndex = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.discovery),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.bookmark),
            label: "",
          ),
        ],
      ),
    );
  }
}
