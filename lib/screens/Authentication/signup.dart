import 'package:doors_tour_app/screens/home_screen/components/bottom_navigator.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController displayController = TextEditingController();

  Future<void> _register() async {
    if (passwordController.text == repasswordController.text) {
      if (true) {
        try {
          setState(() {
            isLoading = true;
          });
          final bool resp = await context.read<AuthService>().signup(
                displayName: displayController.text,
                email: emailController.text.trim(),
                password: passwordController.text,
                passwordConfirm: repasswordController.text,
              );
          if (!resp) {
            throw "Failed to login";
          }
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(Routes.home, (route) => false);

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => BottomNavigator()));
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Couldn't Sign you up"),
              content: Text('$e'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Dismiss"),
                )
              ],
            ),
          );
        } finally {
          setState(() {
            isLoading = false;
          });
        }
      }
    } else if (passwordController.text.length < 6 ||
        repasswordController.text.length < 6) {
      _scaffoldKey.currentState!.showSnackBar(const SnackBar(
          content: Text('Password should be at least 6 character long')));
    } else {
      _scaffoldKey.currentState!.showSnackBar(const SnackBar(
          content: Text('Confirm password and password do not match')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                    "Let's get started",
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFF296B55),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Name*",
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
                          color: Color(0xFF296B55), // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ), // set rounded corner radius
                    ),
                    child: TextFormField(
                      controller: displayController,
                      // style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Enter Full Name...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email*",
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
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ), // set rounded corner radius
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password *",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF296B55),
                      fontWeight: FontWeight.w500,
                    ),
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
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
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
                    height: 20,
                  ),
                  Text(
                    "Confirm Password *",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF296B55),
                      fontWeight: FontWeight.w500,
                    ),
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
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: repasswordController,
                      // style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Confirm Password...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => _register(),
                    child: Container(
                      alignment: Alignment(1, -1),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "SIGNUP",
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
                        "assets/images/Signin1.png",
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
