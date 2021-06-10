import 'package:flutter/material.dart';
class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    int width = (MediaQuery.of(context).size.width).toInt();
    int height = (MediaQuery.of(context).size.height).toInt();
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF1EC78F),
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,iconSize: 30, onPressed: () {}),
        title: Center(child: Text("FUNDS",style: TextStyle(fontSize: 24,color: Colors.white,letterSpacing: 1,
            fontWeight: FontWeight.bold),)),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0,0,10,0),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: Image.asset("assets/images/person.png"),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(0.0,width/2.3),
          child: Image(
            image: AssetImage('assets/images/Rectangle.png'),
            alignment: Alignment.center,
            height: 170,
            width: 384,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Read Out Loud",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),),
              SizedBox(height: 10,),
              Container(
                height: height-(width/1.31),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: Image.asset("assets/images/person.png",fit: BoxFit.fill,),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                            height: 40,
                                            width: 280,
                                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",style: TextStyle(fontSize: 17),)),
                                      ),
                                      SizedBox(height: 0,),
                                      Center(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Updated at 23456"),
                                          SizedBox(width: 90,),
                                          Container(
                                            height: 25,
                                            width:  80,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Center(child: Text("Read Now",style: TextStyle(fontSize: 12),)),
                                          ),
                                        ],
                                      ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5,)
                        ],
                      );
                    }
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
