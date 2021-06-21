import 'package:doors_tour_app/screens/home_screen/components/bottom_navigator.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // this is the process of sign in through email and password
  Future<void> _loginuser() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await context
          .read<AuthService>()
          .login(
              email: emailController.text.trim(),
              password: passwordController.text)
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        // _showFailLoginDialog(e.toString());
        return false;
      });
      setState(() {
        isLoading = false;
      });

      if (res) {
        setState(() {
          isLoading = true;
        });
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil(Routes.home, (route) => false);

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BottomNavigator()));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 55, 20, 0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color(0xFF296B55),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Welcome Again",
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFF296B55),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Email *",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF296B55),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey, // set border color
                        width: 1.0,
                      ), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: TextFormField(
                      controller: emailController,
                      // style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Enter Email...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Password *",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF296B55),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey, // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ), // set rounded corner radius
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      // style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Enter Password...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => _loginuser(),
                    child: Container(
                      alignment: Alignment(1, -1),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "SIGNIN",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF296B55),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment(0, 1),
                      child: Image.asset(
                        "assets/images/Signin2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
