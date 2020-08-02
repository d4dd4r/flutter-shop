import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' as icons;
import 'package:shop/pages/pages.dart';

class BottomNavigatorHelper {
  static const double _navigatorIconSize = 20.0;

  static const List<BottomNavigationBarItem> navigatorItems = const [
    const BottomNavigationBarItem(
      title: const Text('Подборка'),
      icon: const Icon(
        icons.FontAwesome.star_o,
        color: Colors.white54,
        size: _navigatorIconSize,
      ),
      activeIcon: const Icon(
        icons.FontAwesome.star_o,
        color: Colors.white,
        size: _navigatorIconSize,
      ),
    ),
    const BottomNavigationBarItem(
      title: const Text('Каталог'),
      icon: const Icon(
        icons.FontAwesome.list,
        color: Colors.white54,
        size: _navigatorIconSize,
      ),
      activeIcon: const Icon(
        icons.FontAwesome.list,
        color: Colors.white,
        size: _navigatorIconSize,
      ),
    ),
    const BottomNavigationBarItem(
      title: const Text('Избранное'),
      icon: const Icon(
        icons.FontAwesome.heart_o,
        color: Colors.white54,
        size: _navigatorIconSize,
      ),
      activeIcon: const Icon(
        icons.FontAwesome.heart_o,
        color: Colors.white,
        size: _navigatorIconSize,
      ),
    ),
    const BottomNavigationBarItem(
      title: const Text('Профиль'),
      icon: const Icon(
        icons.FontAwesome.smile_o,
        color: Colors.white54,
        size: _navigatorIconSize,
      ),
      activeIcon: const Icon(
        icons.FontAwesome.smile_o,
        color: Colors.white,
        size: _navigatorIconSize,
      ),
    ),
    const BottomNavigationBarItem(
      title: const Text('Корзина'),
      icon: const Icon(
        icons.FontAwesome.shopping_bag,
        color: Colors.white54,
        size: _navigatorIconSize,
      ),
      activeIcon: const Icon(
        icons.FontAwesome.shopping_bag,
        color: Colors.white,
        size: _navigatorIconSize,
      ),
    ),
  ];

  static const List<Widget> navigationWidgetOptions = const [
    const HighlightPage(appTitle: 'Flutter Shop'),
    const CatalogPage(appTitle: 'Каталог'),
    const FavoritePage(appTitle: 'Избанное'),
    const ProfilePage(appTitle: 'Профиль'),
    const CartPage(appTitle: 'Корзина'),
  ];
}
