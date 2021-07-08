import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:doors_tour_app/widgets/loader.dart';
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
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.home, (route) => false);
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
      body: LoadingDisabler(
        isDisabled: isLoading,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20.0),
          color: Constants.kPrimaryColor,
          child: Form(
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
                    "Welcome Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 105, 82),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 105, 82),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      _loginuser();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.25,
                          vertical: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
