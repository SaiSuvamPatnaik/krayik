import 'package:flutter/material.dart';

class prices extends StatefulWidget {
  @override
  _pricesState createState() => _pricesState();
}

class _pricesState extends State<prices> {
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
        backgroundColor: Color(0xFF1EC78F),
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
          )),
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
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: Image.asset("assets/images/person.png"),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(0.0, width / 4),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 7, 20, 20),
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
                  color: Color(0xFF1EC78F),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "ALL REITS and INVITs",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1EC78F),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: height - 270,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: index == 0 ? 50 : 75,
                  child: Card(
                    elevation: index == 0 ? 0 : 2,
                    color: index == 0 ? Colors.white : Color(0xFFEFF4F4),
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
                                    child: Text("NAME",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              )
                            : Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        "REIT/INVIT",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "REIT",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
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
                                      ))),
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
                                            color: Color(0xFF1EC78F),
                                            fontWeight: FontWeight.w600),
                                      ))),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
