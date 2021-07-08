import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  void onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      Navigator.pushReplacementNamed(
          context, Routes.bottomNavBarRoutes[_currentIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.kPrimaryColor,
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFB6B6B6),
      elevation: 10.0,
      showSelectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/home.svg"),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/funds.svg"),
          label: "Funds",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/prices.svg"),
          label: "Prices",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/news.svg"),
          label: "News",
        ),
      ],
    );
  }
}
