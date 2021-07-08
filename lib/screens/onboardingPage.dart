import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:doors_tour_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  List<Map<dynamic, dynamic>> onboardingData = [
    {
      "text1": "QUICK AND EASY",
      "text2": "One-stop solution for all your real estate investment goals",
      "image": "assets/images/image1.JPG"
    },
    {
      "text1": "MARKET RESEARCH",
      "text2": "Choose from a wide range of Reits, InvITS, mutual funds etc",
      "image": "assets/images/image2.JPG"
    },
    {
      "text1": "RELIABLE",
      "text2":
          "Best in class mechanism to track all major real estate pointers",
      "image": "assets/images/image3.JPG"
    },
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(onboardingData[index]['image']),
                    ),
                    onPageChanged: (value) => {
                      setState(() => {
                            currentPage = value,
                          })
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      color: Constants.kPrimaryColor,
                    ),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) => buildDot(index),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            onboardingData[currentPage]["text1"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            onboardingData[currentPage]["text2"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              child: Text(
                                currentPage == (onboardingData.length - 1)
                                    ? "NEXT"
                                    : "SKIP",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, Routes.logInSignUp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
