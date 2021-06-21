import 'package:flutter/material.dart';

import '../home_screen/components/bottom_navigator.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  int mobileNumber = 1234567890;
  String code = "";
  List<TextEditingController> _controller = [
    for (int i = 1; i < 75; i++) TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height * 0.75,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Image.asset("assets/images/otp_section.png"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "OTP Verification",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "We have sent the verification code to your mobile number ${(mobileNumber / 100000000).toInt()}XXXXXXXX",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textBoxes(0),
                          textBoxes(1),
                          textBoxes(2),
                          textBoxes(3),
                          textBoxes(4),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive the code? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          for (int i = 0; i < 5; i++)
                            code = code + _controller[i].text;
                          print(code);
                          print(code);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BottomNavigator(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 65, 186, 139),
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 35.0,
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          child: Text(
                            "Verify and Proceed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textBoxes(int codeNumber) {
    return Container(
        margin: EdgeInsets.all(8.0),
        width: 25.0,
        height: 25.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            new BoxShadow(
              color: Color.fromARGB(255, 65, 186, 139),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: _controller[codeNumber],
            maxLength: 1,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}
