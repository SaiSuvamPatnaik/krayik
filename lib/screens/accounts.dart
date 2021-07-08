import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/screens/Authentication/login_sign_up.dart';
import 'package:doors_tour_app/services/GoogleSignInApi.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:doors_tour_app/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  GoogleSignInAccount? user;
  var imageUrl =
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/man-vector-design-template-1ba90da9b45ecf00ceb3b8ae442ad32c_screen.jpg?ts=1601484738";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=GoogleSignInApi.currentuser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              // height: 205.0,
              decoration: BoxDecoration(
                color: Constants.kPrimaryColor,
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
                  // SizedBox(
                  //   height: 10.0,
                  // ),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                             height: 60.0,
                             width: 60.0,
                            color: Color(0xffFF0E58),
                            child: user!.photoUrl==null ? Image.network(imageUrl)
                                : Image.network(user!.photoUrl.toString()),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Logged in as: ",
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
                            user!.displayName.toString(),
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
                    child: SvgPicture.asset("assets/icons/aboutUs.svg"),
                  ),
                  "About Us",
                ),
                options(
                  Container(
                    height: 25,
                    child: SvgPicture.asset("assets/icons/help_support.svg"),
                  ),
                  "Help and Support",
                ),
                options(
                  Container(
                    height: 25,
                    child: SvgPicture.asset("assets/icons/refer.svg"),
                  ),
                  "Refer and Earn",
                ),
                options(
                  Container(
                    height: 25,
                    child: SvgPicture.asset("assets/icons/rateus.svg"),
                  ),
                  "Rate Us",
                ),
                options(
                  Container(
                    height: 25,
                    child: SvgPicture.asset("assets/icons/insta.svg"),
                  ),
                  "Follow Us in Instagram",
                ),
                options(
                  Container(
                    height: 25,
                    child: SvgPicture.asset("assets/icons/Logout.svg"),
                  ),
                  "Log Out",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "App version v15.0.1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Image.asset(
                  "assets/icons/krayikLogo.png",
                  color: Colors.grey,
                  height: 15.0,
                ),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar:
      BottomNavigator(index: 0),
    );
  }

  Widget options(Container icon, String text) {
    Future<void> _signOut() async {
      context.read<AuthService>().logout();
      print("heh");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginSignUp()),
          (route) => true);
      return;
    }

    return GestureDetector(
      // onTap: () => _signOut(),
      onTap: () {
        text == "Refer and Earn"
            ? Navigator.pushNamed(context, Routes.referAndEarn)
            : text=="Log Out"? signout():print(text);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 11.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(222, 222, 222, 0.7),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                0.0,
                1.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 0.2,
            ),
          ],
        ),
        // padding: EdgeInsets.all(10.0),
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
            // Expanded(
            //   flex: 1,
            //   child: Icon(Icons.navigate_next, color: Colors.black, size: 30.0,)
            // ),
          ],
        ),
      ),
    );
  }

  signout() {
    GoogleSignInApi.logout();
    Navigator.pushNamed(context, Routes.logInSignUp);
  }
}
