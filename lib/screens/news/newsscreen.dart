import 'package:flutter/material.dart';

class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF1EC78F),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {}),
        title: Center(
            child: Text(
          "NEWS",
          style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        )),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
          preferredSize: Size(0.0, width / 2.3),
          child: Image(
            image: AssetImage('assets/images/Rectangle1.png'),
            alignment: Alignment.center,
            height: 170,
            width: width - 10,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                          color: Color(
                              0xFF1EC78F),
                          borderRadius:
                          BorderRadius
                              .circular(
                              15)),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            child: Text(
                              "ALL",
                              style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 15),
                            ),
                          )),
                    ),
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                          color: Color(
                              0xFF1EC78F),
                          borderRadius:
                          BorderRadius
                              .circular(
                              15)),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            child: Text(
                              "REITS",
                              style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 15),
                            ),
                          )),
                    ),
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                          color: Color(
                              0xFF1EC78F),
                          borderRadius:
                          BorderRadius
                              .circular(
                              15)),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            child: Text(
                              "INVITS",
                              style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 15),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height - (width / 1.14),
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 80,
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: Image.asset(
                                      Imagesinbox(index),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Container(
                                              width: width - 110,
                                              child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  )),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            width: width - 110,
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.history,
                                                            color: Colors.green,
                                                            size: 13,
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            "Updated ${index} days ago",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 20, 0),
                                                      child: Container(
                                                        height: 20,
                                                        width: 70,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF1EC78F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                            child: Text(
                                                          "Read Now",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  String Imagesinbox(int index) {
    if (index % 4 == 0) {
      return "assets/images/Rectangle2.png";
    }
    if (index % 4 == 1) {
      return "assets/images/Rectangle3.png";
    }
    if (index % 4 == 2) {
      return "assets/images/Rectangle4.png";
    } else
      return "assets/images/Rectangle5.png";
  }
}
