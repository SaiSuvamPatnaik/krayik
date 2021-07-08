import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/screens/home/home.dart';
import 'package:doors_tour_app/services/GoogleSignInApi.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            color: Constants.kPrimaryColor,
            child: ListView(
              children: [
                // Container(
                //   height: 30.0,
                //   alignment: Alignment.topLeft,
                //   child: Image.asset("assets/icons/krayikLogo.png"),
                // ),
                Container(
                  // margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.all(60),
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 105, 82),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      "assets/icons/krayik2.png",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    "Welcome to Krayik",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    signin();
//                    Navigator.pushNamed(context, Routes.home);
                  },
                  child: Container(
                    // padding: EdgeInsets.all(7.5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 105, 82),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Image.asset("assets/icons/Google__G__Logo.png"),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          alignment: Alignment.center,
                          child: Text(
                            "SignUp with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 105, 82),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 30.0,
                              )),
                          backgroundColor: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          alignment: Alignment.center,
                          child: Text(
                            "SignUp with Email",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 75.0,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signIn);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signin() async {
    final user = await GoogleSignInApi.login();
    if (user==null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign-In Failed")));
    }
    else{
      Navigator.pushReplacementNamed(
          context, Routes.home);
    }
  }
}
