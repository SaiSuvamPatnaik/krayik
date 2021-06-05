import 'package:doors_tour_app/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int topListViewIndex = 0;
  String name = "Hardik";
  var imageUrl =
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/man-vector-design-template-1ba90da9b45ecf00ceb3b8ae442ad32c_screen.jpg?ts=1601484738";

  List<Map<dynamic, dynamic>> homePageTopListView = [
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
  ];

  List<Map<dynamic, dynamic>> mfsAndSmallCasesList = [
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "Parag Parikh Flexi Cap Fund Direct Growth",
      "minAmount": 1000,
      "cacr": 67.19,
      "condition": "High Risk",
      "returnDuration": 1
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "ICICI Prudential Tech Direct Plan Growth",
      "minAmount": 2000,
      "cacr": 129.14,
      "condition": "Low Risk",
      "returnDuration": 1
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "Parag Parikh Flexi Cap Fund Direct Growth",
      "minAmount": 1000,
      "cacr": 67.19,
      "condition": "High Risk",
      "returnDuration": 1
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "ICICI Prudential Tech Direct Plan Growth",
      "minAmount": 2000,
      "cacr": 129.14,
      "condition": "Low Risk",
      "returnDuration": 1
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "Parag Parikh Flexi Cap Fund Direct Growth",
      "minAmount": 1000,
      "cacr": 67.19,
      "condition": "High Risk",
      "returnDuration": 1
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "growth": "Parag Parikh Flexi Cap Fund Direct Growth",
      "minAmount": 1000,
      "cacr": 67.19,
      "condition": "High Risk",
      "returnDuration": 1
    }
  ];

  List<Map<dynamic, dynamic>> topMoversList = [
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Mindspace",
      "amount": 280000000000,
      "increament": true,
      "percent": 1.83,
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Codrej",
      "amount": 37505461.61,
      "increament": false,
      "percent": 2.33,
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Mindspace",
      "amount": 280000000000,
      "increament": true,
      "percent": 1.83,
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Codrej",
      "amount": 37505461.61,
      "increament": false,
      "percent": 2.33,
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Mindspace",
      "amount": 280000000000,
      "increament": true,
      "percent": 1.83,
    },
    {
      "imageUrl":
          "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
      "name": "Codrej",
      "amount": 37505461.61,
      "increament": false,
      "percent": 2.33,
    },
  ];

  List<String> krayikFactsList = [
    "Culpa sed perspiciatis illo add earum fugiat",
    "Culpa sed perspiciatis illo add earum fugiat",
    "Culpa sed perspiciatis illo add earum fugiat",
    "Culpa sed perspiciatis illo add earum fugiat",
  ];

  // VideoPlayerController controller = VideoPlayerController.asset("");

  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.network(
  //       "https://www.youtube.com/watch?v=x0ZNQ0YXyfE&t=0s")
  //     ..addListener(() {
  //       setState(() {});
  //     })
  //     ..setLooping(true)
  //     ..initialize().then((value) => controller.play());
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            topHorizontalListView(),
            SizedBox(
              height: 30.0,
            ),
            contents(
                heading: "MF's And Small Cases",
                subHeading: "MF's And Small Cases"),
            contents(heading: "Top Movers", subHeading: "in REITs, INVITs etc"),
            contents(
                heading: "Learn with Krayik",
                subHeading: "Making REITs and INVITs Investment easy"),
            contents(
                heading: "Karyik Fact Zone",
                subHeading: "some quick tips for your investments"),
            bottomAds(),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        index == topListViewIndex
            ? Container()
            : Container(
                margin: EdgeInsets.all(3),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
        Container(
          margin:
              index == topListViewIndex ? EdgeInsets.all(2) : EdgeInsets.all(4),
          height: index == topListViewIndex ? 10 : 6,
          width: index == topListViewIndex ? 10 : 6,
          decoration: BoxDecoration(
            color: topListViewIndex == index
                ? Color.fromARGB(255, 65, 186, 139)
                : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  Container topListView(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Stack(children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  homePageTopListView[topListViewIndex]["text"],
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 65, 186, 139),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Image.asset(homePageTopListView[index]["image"]),
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 20),
        )
      ]),
    );
  }

  Widget contents({required String heading, required String subHeading}) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Text(
            subHeading,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            height: heading == "MF's And Small Cases"
                ? 210
                : (heading == "Karyik Fact Zone"
                    ? 130
                    : heading == "Learn with Krayik"
                        ? 250
                        : 170),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                if (heading == "MF's And Small Cases")
                  for (int i = 0; i < mfsAndSmallCasesList.length; i++)
                    middleHorizontalListView(i),
                if (heading == "Top Movers")
                  for (int i = 0; i < topMoversList.length; i++)
                    bottomHorizontalListView(i),
                if (heading == "Karyik Fact Zone")
                  for (int i = 0; i < krayikFactsList.length; i++)
                    karyikFactHorizontalListView(i),
                if (heading == "Learn with Krayik") videoPlayerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topHorizontalListView() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 65, 186, 139),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, $name",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Welcome to Krayik",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        color: Color(0xffFF0E58),
                        child: Image.network(imageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Featured",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: homePageTopListView.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 3, bottom: 5),
                            child: topListView(index),
                          ),
                          onPageChanged: (value) => {
                            setState(() => {
                                  topListViewIndex = value,
                                })
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildDot(0),
                              buildDot(1),
                              buildDot(2),
                              buildDot(3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget middleHorizontalListView(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(206, 228, 228, 100),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        color: Color(0xffFF0E58),
                        child: Image.network(
                            mfsAndSmallCasesList[index]["imageUrl"]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topRight,
                    height: MediaQuery.of(context).size.height * 0.023,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${mfsAndSmallCasesList[index]["returnDuration"]} Year Return",
                        style: TextStyle(
                          fontSize: 9.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              child: Text(
                mfsAndSmallCasesList[index]["growth"],
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 3.0, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                "Minimum SIP Amount Rs.${mfsAndSmallCasesList[index]["minAmount"]}",
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "CACR\n${mfsAndSmallCasesList[index]["cacr"]}%",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: MediaQuery.of(context).size.height * 0.023,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: mfsAndSmallCasesList[index]["condition"] ==
                              "High Risk"
                          ? Colors.red
                          : Colors.green,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${mfsAndSmallCasesList[index]["condition"]}",
                        style: TextStyle(
                          fontSize: 9.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomHorizontalListView(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
        color: Color.fromRGBO(206, 228, 228, 100),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  color: Color(0xffFF0E58),
                  child: Image.network(topMoversList[index]["imageUrl"]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                topMoversList[index]["name"],
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 3.0, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                "Rs.${topMoversList[index]["amount"]}",
                style: TextStyle(fontSize: 13.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                (topMoversList[index]["increament"])
                    ? "+${topMoversList[index]["percent"]}%"
                    : "-${topMoversList[index]["percent"]}%",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  color: (topMoversList[index]["increament"])
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget karyikFactHorizontalListView(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 65, 186, 139),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 15.0,
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/icons/colon1.png",
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Text(
              krayikFactsList[index],
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 15.0,
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/icons/colon2.png",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget videoPlayerWidget() {
    // return (controller.value.isInitialized)
    //     ? Container(
    //         child: AspectRatio(
    //           aspectRatio: controller.value.aspectRatio,
    //           child: VideoPlayer(controller),
    //         ),
    //       )
    //     : Container(
    //         height: 200.0,
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );
  }

  Widget bottomAds() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
        child: Image.asset("assets/images/ads.png"),
      ),
    );
  }
}
