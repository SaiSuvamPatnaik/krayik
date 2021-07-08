import 'package:doors_tour_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget fundtab(BuildContext context, String position) {
  var imageUrl =
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/man-vector-design-template-1ba90da9b45ecf00ceb3b8ae442ad32c_screen.jpg?ts=1601484738";

  List<Map<dynamic, dynamic>> mutualfunddata = [
    {
      "text1": "AXIS Small Cap Fund",
      "text2": "Direct Growth",
      "image":
          "https://www.incimages.com/uploaded_files/image/1920x1080/getty_158673029_9707279704500119_78594.jpg"
    },
    {
      "text1": "ICICI Prudential Technology",
      "text2": "Direct Plan Growth",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Idea Example Technology",
      "text2": "Direct Plan Growth",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
    {
      "text1": "ICICI Prudential Technology",
      "text2": "Direct Plan Growth",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Idea Example Technology",
      "text2": "Direct Plan Growth",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
  ];
  List<Map<dynamic, dynamic>> mutualfunddata1 = [
    {
      "text1": "Example Industry",
      "text2": "Smallcase one",
      "image":
      "https://www.incimages.com/uploaded_files/image/1920x1080/getty_158673029_9707279704500119_78594.jpg"
    },
    {
      "text1": "Example Two Industry",
      "text2": "Smallcase two",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Example Industry",
      "text2": "Smallcase one",
      "image":
      "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
    {
      "text1": "Example Two Industry",
      "text2": "Smallcase two",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Example Industry",
      "text2": "Smallcase one",
      "image":
      "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
  ];
  return ListView.builder(
      itemCount: mutualfunddata.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(222, 222, 222, 0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 55.0,
                            width: 55.0,
                            color: Color(0xffFF0E58),
                            child: Image.network(imageUrl),
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Constants.kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "1 Year return",
                            textScaleFactor: 1.0,
                            style: TextStyle(fontSize: 12,color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        position=="1" ? Text(
                          mutualfunddata[index]["text1"],
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.0,
                          ) : Text(
                          mutualfunddata1[index]["text1"],
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.0,
                        ),
                        position=="1" ? Text(
                          mutualfunddata[index]["text2"],
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.0,
                        ) : Text(
                          mutualfunddata1[index]["text2"],
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.0,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Min SIP Amount: RS 500/-",
                          style: TextStyle(fontSize: 15),
                          textScaleFactor: 1.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CAGR",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              "94.15%",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Constants.kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.redAccent
                                : Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12, 5, 12, 5),
                            child: Center(
                              child: index % 2 == 0
                                  ? Text(
                                      "High Risk",
                                textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white),
                                    )
                                  : Text(
                                      "Less Risk",
                                textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
