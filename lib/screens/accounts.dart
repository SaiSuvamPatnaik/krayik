import 'package:doors_tour_app/screens/referandearn.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  final imageUrl;
  final emailId;
  const Accounts({Key? key, this.imageUrl, this.emailId}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              height: 205.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 65, 186, 139),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Accounts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "x",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            color: Color(0xffFF0E58),
                            child: Image.network(widget.imageUrl),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Loged in as: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.emailId,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                options(
                  Container(
                    height: 25,
                    child: Image.asset(
                      "assets/icons/aboutUs.png",
                    ),
                  ),
                  "About Us",
                ),
                options(
                  Container(
                    height: 25,
                    child: Image.asset(
                      "assets/icons/helpAndSupport.png",
                    ),
                  ),
                  "Help and Support",
                ),
                options(
                  Container(
                    height: 25,
                    child: Image.asset(
                      "assets/icons/referAndEarn.png",
                    ),
                  ),
                  "Refer and Earn",
                ),
                options(
                  Container(
                    height: 25,
                    child: Image.asset(
                      "assets/icons/rateUs.png",
                    ),
                  ),
                  "Rate Us",
                ),
                options(
                  Container(
                    height: 25,
                    child: Image.asset(
                      "assets/icons/insta.png",
                    ),
                  ),
                  "Follow Us in Instagram",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "App version v15.0.1\nKrayik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget options(Container icon, String text) {
    return GestureDetector(
      onTap: (){
        text=="Refer and Earn"?Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => referandearn())):print(text);
      },
      child: Container(
        margin: EdgeInsets.all(6.0),
        height: 60.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(203, 230, 230, 0.3),
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: icon,
            ),
            Expanded(
              flex: 8,
              child: Text(
                text,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                ">",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
