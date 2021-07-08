import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/services/auth.dart';
import 'package:doors_tour_app/utils/router/RoutingUtils.dart';
import 'package:doors_tour_app/widgets/loader.dart';
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
    repasswordController = passwordController;
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
            throw "Failed to Sign up";
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Verification Email sent"),
                content: Text('Verify your email and login into the app!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text("Dismiss"),
                  )
                ],
              ),
            );
          }
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
    } else if (passwordController.text.length < 8 ||
        repasswordController.text.length < 8) {
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
      body: LoadingDisabler(
        isDisabled: isLoading,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: Constants.kPrimaryColor,
          child: Form(
            key: _formKey,
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
                    "Let's get started",
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
                    // validator: (value) => value!.isEmpty
                    //       ? 'Enter Your Name'
                    //       : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value)
                    //           ? 'Enter a Valid Name'
                    //           : null,
                    controller: displayController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Full Name",
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
                    // validator: (value) {
                    //   Pattern pattern =
                    //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    //       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    //       r"{0,253}[a-zA-Z0-9])?)*$";
                    //   RegExp regex = new RegExp(pattern);
                    //   if (!regex.hasMatch(value) || value == null)
                    //     return 'Enter a valid email address';
                    //   else
                    //     return null;
                    // },
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
                    // validator: (value) {
                    //     String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    //     RegExp regExp = new RegExp(pattern);
                    //     return (regExp.hasMatch(value!)?null:"Enter valid password");
                    // },
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
                      _register();
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
                          "Sign Up",
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
