import 'package:doors_tour_app/screens/Funds/mutualfund.dart';
import 'package:flutter/material.dart';

class fundbody extends StatefulWidget {
  @override
  _fundbodyState createState() => _fundbodyState();
}

class _fundbodyState extends State<fundbody>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();
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
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xFF1EC78F),
        ),
        backgroundColor: Color(0xFF1EC78F),
        bottom: PreferredSize(
            preferredSize: Size(0.0, width / 2.8),
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
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )),
                      trailing: Container(
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
                      )),
                  Padding(
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
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: controller,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text(
                            "Mutual Funds",
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Small Cases",
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: TabBarView(
          controller: controller,
          children: [fundtab(context), fundtab(context)],
        ),
      ),
    );
  }
}
