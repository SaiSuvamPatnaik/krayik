import 'package:doors_tour_app/screens/Authentication/signup.dart';
import 'package:doors_tour_app/screens/login_sign_up.dart';
import 'package:doors_tour_app/screens/otp_verification.dart';
import 'package:flutter/material.dart';
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,55,20,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => LoginSignUp()));
                            },
                            child: Icon(Icons.arrow_back,size: 30,color: Color(0xFF296B55),)),
                        SizedBox(height: 35,),
                        Text("Let's get started",style: TextStyle(fontSize: 26,color: Color(0xFF296B55),fontWeight: FontWeight.bold),),
                        SizedBox(height: 25,),
                        Text("Name*",style: TextStyle(fontSize: 16,color: Color(0xFF296B55),fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xFF296B55),// set border color
                                width: 1.0),   // set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), // set rounded corner radius
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              border: InputBorder.none,
                            ),
                            onChanged: (value1){

                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Email*",style: TextStyle(fontSize: 16,color: Color(0xFF296B55),fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,// set border color
                                width: 1.0),   // set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), // set rounded corner radius
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: "joebiden@gmail.com",
                              border: InputBorder.none,
                            ),
                            onChanged: (value2){

                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Phone No*",style: TextStyle(fontSize: 16,color: Color(0xFF296B55),fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,// set border color
                                width: 1.0),   // set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), // set rounded corner radius
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: "9999999999",
                              border: InputBorder.none,
                            ),
                            onChanged: (value3){

                            },
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          alignment: Alignment(1,-1),
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => OtpVerification()));
                              },
                              child: Text("SEND OTP",style: TextStyle(fontSize: 16,color: Color(0xFF296B55),fontWeight: FontWeight.w500),)),
                        )
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: Container(
                    child: Align(
                        alignment: Alignment(0, 1),
                        child: Image.asset("assets/images/Signin1.png",fit: BoxFit.cover,)
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
