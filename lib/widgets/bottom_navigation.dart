import 'package:flutter/material.dart';
import 'package:shop/helpers/helpers.dart';

enum NavigationTabs {
  highlight,
  catalog,
  favorite,
  profile,
  cart,
}

class BottomNavigation extends StatelessWidget {
  final NavigationTabs selectedTab;
  final ValueChanged<NavigationTabs> onTapTab;

  BottomNavigation({@required this.selectedTab, @required this.onTapTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: BottomNavigatorHelper.navigatorItems,
      currentIndex: selectedTab.index,
      onTap: (index) => onTapTab(NavigationTabs.values[index]),
    );
  }
}
