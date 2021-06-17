import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';


class NavBar extends StatefulWidget {
  final int startIndex;

  const NavBar({
    Key key, this.startIndex,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.startIndex;

    return FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.amber,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            Navigator.pushNamed(context, selectedIndex.toString());
                }
                );
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.show_chart_outlined ,
            label: 'Top Fits',
            selectedBackgroundColor: Colors.green,
          ),
          FFNavigationBarItem(
            iconData: Icons.category,
            label: 'Explore',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Search',
            selectedBackgroundColor: Colors.green,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
            selectedBackgroundColor: Colors.green,
          ),
        ]
    );
  }
}