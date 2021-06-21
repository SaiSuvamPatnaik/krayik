import 'package:flutter/material.dart';
class referandearn extends StatefulWidget {
  @override
  _referandearnState createState() => _referandearnState();
}

class _referandearnState extends State<referandearn> {
  List<Map<dynamic, dynamic>> referandearndatas = [
    {
      "text1": "Sony Bass 500",
      "text2": "Referral needed: 30",
      "image": "assets/images/refer&earn1.png",
      "color": Color(0xFFd5d9ff),
    },
    {
      "text1": "IPhone 12",
      "text2": "Referral Needed: 100",
      "image": "assets/images/refer&earn2.png",
      "color": Color(0xFF1c1c1c),
    },
  ];
  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                "REFER & EARN",
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              width: width-5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("doorstour.com/referral/user/25256",style: TextStyle(fontSize: 16),),
                    SizedBox(width: 20,),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(
                              0xFF1EC78F),
                          borderRadius:
                          BorderRadius
                              .circular(
                              15)),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,5,0,5),
                            child: Text(
                              "COPY",
                              style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 12),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("App Downloads",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("Referrals: 45",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: height-210,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index%2==0?referandearndatas[0]["color"]:referandearndatas[1]["color"],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 200,
                        child: Row(
                          children: [
                            index%2==0?Image.asset(referandearndatas[0]["image"]):Image.asset(referandearndatas[1]["image"]),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(""),
                                  Column(
                                    children: [
                                      Text(index%2==0?referandearndatas[0]["text1"]:referandearndatas[1]["text1"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold
                                          ,color: index%2==0?Colors.black:Colors.white)),
                                      Text(index%2==0?referandearndatas[0]["text2"]:referandearndatas[1]["text2"],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500
                                      ,color: index%2==0?Colors.black:Colors.white)),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0,0,0,10),
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0,5,0,5),
                                          child: Text(
                                            "CLAIM NOW",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
