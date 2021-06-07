import 'package:doors_tour_app/screens/Funds/fundbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  String name = "Hardik";
  int _currentIndex = 0;

  final tabs = [
    Home(),
    fundbody(),
    Home(),
    Home(),
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigator(),
      body: tabs[_currentIndex],
    );
  }

  Widget bottomNavigator() {
    return BottomNavigationBar(
        iconSize: 10.0,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 25.0,
              child: Image.asset(
                "assets/icons/home.png",
                color: _currentIndex == 0
                    ? Color.fromARGB(255, 65, 186, 139)
                    : Colors.grey,
              ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "Home",
              style: TextStyle(
                  color: _currentIndex == 0
                      ? Color.fromARGB(255, 65, 186, 139)
                      : Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 25.0,
              child: Image.asset("assets/icons/funds.png",
                  color: _currentIndex == 1
                      ? Color.fromARGB(255, 65, 186, 139)
                      : Colors.grey),
            ),
            title: Text("Funds",
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color.fromARGB(255, 65, 186, 139)
                        : Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 25.0,
              child: Image.asset("assets/icons/prices.png",
                  color: _currentIndex == 2
                      ? Color.fromARGB(255, 65, 186, 139)
                      : Colors.grey),
            ),
            title: Text("Prices",
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color.fromARGB(255, 65, 186, 139)
                        : Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 25.0,
              child: Image.asset("assets/icons/news.png",
                  color: _currentIndex == 3
                      ? Color.fromARGB(255, 65, 186, 139)
                      : Colors.grey),
            ),
            title: Text("News",
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color.fromARGB(255, 65, 186, 139)
                        : Colors.grey)),
          ),
        ]);
  }
}
