import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_market_task/pages/cart.dart';
import 'package:online_market_task/pages/catalog.dart';
import 'package:online_market_task/pages/home.dart';
import 'package:online_market_task/pages/profile.dart';
import 'package:online_market_task/pages/saved.dart';

import '../util.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  int bottomIndex = 0;

  final list = [
    const HomePage(),
    const CatalogPage(),
    const CartPage(),
    const SavedPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrangeAccent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(bottomIndex == 0 ? Colors.deepOrangeAccent : Colors.grey, BlendMode.srcIn),
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search_bottom.svg',
              colorFilter: ColorFilter.mode(bottomIndex == 1 ? Colors.deepOrangeAccent : Colors.grey, BlendMode.srcIn),
            ),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart_bottom.svg',
              colorFilter: ColorFilter.mode(bottomIndex == 2 ? Colors.deepOrangeAccent : Colors.grey, BlendMode.srcIn),
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: ColorFilter.mode(bottomIndex == 3 ? Colors.deepOrangeAccent : Colors.grey, BlendMode.srcIn),
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              colorFilter: ColorFilter.mode(bottomIndex == 4 ? Colors.deepOrangeAccent : Colors.grey, BlendMode.srcIn),
            ),
            label: 'Профиль',
          ),
        ],
        onTap: (index){
          setState(() {
            bottomIndex = index;
          });
        },
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'ORZUGRAND',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(onPressed: showToast, icon: SvgPicture.asset('assets/icons/location.svg')),
        ),
        actions: [
          IconButton(onPressed: showToast, icon: SvgPicture.asset('assets/icons/chat.svg')),
        ],
      ),
      body: list[bottomIndex],
    );
  }
}
