import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:regester/feature/Fav_Screen/fav_screen.dart';
import 'package:regester/feature/cart/cart_view.dart';
import 'package:regester/language.dart';

import '../../core/global/api.dart';
import '../Awidget/main_drawer.dart';
import '../first_screen/First_Screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  late List<Widget> _tabs;

  CircularBottomNavigationController? _navigationController;

  @override
  void initState() {
    _navigationController = CircularBottomNavigationController(_selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabs = [
      const FirstScreen() ,
      FavScreen(),
      const CartView(),
    ];
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: _tabs[_selectedIndex],
        bottomNavigationBar: CircularBottomNavigation(
          [
            TabItem(
              Icons.home_filled,
              Language.isEn ? 'Home' : 'الرئيسية',
              Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TabItem(
              Icons.favorite,
              Language.isEn ? "Favorites": 'المفضلة',
              Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TabItem(
              Icons.shopping_cart_outlined,
              Language.isEn ? "Cart" : 'السلة',
              Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          controller: _navigationController,
          selectedPos: _selectedIndex,
          barBackgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 300),
          selectedCallback: (selected) {
            setState(() {
              _selectedIndex = selected!;
            });
          },
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
