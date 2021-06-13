import 'package:doors_tour_app/screens/Authentication/Signin.dart';
import 'package:doors_tour_app/screens/Authentication/signup.dart';
import 'package:doors_tour_app/screens/home_screen/components/bottom_navigator.dart';
import 'package:doors_tour_app/screens/otp_verification.dart';
import 'package:flutter/material.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            color: Color.fromARGB(255, 65, 186, 139),
            child: ListView(
              children: [
                Container(
                  height: 30.0,
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/icons/krayikLogo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset("assets/images/login_signUp.png"),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BottomNavigator()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.5),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Google__G__Logo.png"),
                          Container(
                            child: Text(
                              "Signup with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => signup()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Signup with email or phone",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Joined us before?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => signin()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.deepPurple,
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
}
