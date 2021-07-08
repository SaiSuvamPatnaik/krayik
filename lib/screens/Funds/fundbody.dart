import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/screens/Funds/mutualfund.dart';
import 'package:doors_tour_app/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class Funds extends StatefulWidget {
  @override
  _FundsState createState() => _FundsState();
}

class _FundsState extends State<Funds> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    print(width);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.kPrimaryColor,
        bottom: PreferredSize(
          preferredSize: Size(0.0, width / 3),
          child: Container(
            child: Column(
              children: [
                ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {}),
                  title: Center(
                    child: Text(
                      "FUNDS",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Image.asset("assets/images/person.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 7, 10, 20),
                  child: TextField(
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      hintText: "Search MFS and Smallcases",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Constants.kPrimaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Text(
                          "Mutual Funds",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Constants.kPrimaryColor, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Small Cases",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Constants.kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width-40,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: TabBarView(
            controller: controller,
            children: [fundtab(context,"1"), fundtab(context,"2")],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(index: 1),
    );
  }
}
