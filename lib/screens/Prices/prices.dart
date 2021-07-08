import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/screens/Prices/price_details.dart';
import 'package:doors_tour_app/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class Prices extends StatefulWidget {
  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();
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
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {}),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Center(
            child: Text(
              "PRICES",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
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
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(0.0, width / 4),
          child: Padding(
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "     ALL REITS and INVITs     ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Constants.kPrimaryColor,
                  shadows: [
                    Shadow(
                        color: Constants.kPrimaryColor, offset: Offset(0, -8))
                  ],
                  decorationThickness: 2.5,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              height: height - 290,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PriceDetails()));
                    },
                    child: Container(
                      margin: index == 0
                          ? EdgeInsets.all(0)
                          : EdgeInsets.only(bottom: 10.0),
                      height: index == 0 ? 50 : 65,
                      child: Card(
                        elevation: index == 0 ? 0 : 2,
                        color: index == 0
                            ? Colors.white
                            : Color.fromRGBO(222, 222, 222, 0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == 0
                                ? Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        "COMPANY NAME",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          child: Image.asset(
                                              "assets/images/person.png"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Mindspace")
                                      ],
                                    ),
                                  ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: index == 0
                                    ? Text(
                                        "LABEL",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "REIT",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: index == 0
                                    ? Text(
                                        "PRICE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "2700",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: index == 0
                                    ? Text(
                                        "CHANGE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "+0.56%",
                                        style: TextStyle(
                                            color: Constants.kPrimaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(index: 2),
    );
  }
}
