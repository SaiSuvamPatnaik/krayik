import 'package:flutter/material.dart';
Widget fundtab(BuildContext context){
  List<Map<dynamic, dynamic>> mutualfunddata = [
    {
      "text1": "AXIS Small Cap Fund",
      "text2": "Direct Growth",
      "image": "https://www.incimages.com/uploaded_files/image/1920x1080/getty_158673029_9707279704500119_78594.jpg"
    },
    {
      "text1": "ICICI Prudential Technology",
      "text2": "Direct Plan Growth",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Idea Example Technology",
      "text2": "Direct Plan Growth",
      "image": "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
    {
      "text1": "ICICI Prudential Technology",
      "text2": "Direct Plan Growth",
      "image": "https://indianfolk.com/wp-content/uploads/2019/03/bank-logo.jpg"
    },
    {
      "text1": "Idea Example Technology",
      "text2": "Direct Plan Growth",
      "image": "https://upload.wikimedia.org/wikipedia/commons/a/aa/Canara_Bank_Head_Office_Bengaluru.jpg"
    },
  ];
  return ListView.builder(
    itemCount: mutualfunddata.length,
    itemBuilder: (context,index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width-60,
            decoration: BoxDecoration(color: Color(0xFFEFF4F4),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                        ),
                        child: Image.asset("assets/images/person.png"),
                        ),
                      trailing: Container(
                        height: 25,
                        width:  110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("1 Year return",style: TextStyle(fontSize: 12),)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mutualfunddata[index]["text1"],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            Text(mutualfunddata[index]["text2"],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            SizedBox(height: 7,),
                            Text("Min SIP Amount: RS 500/-",style: TextStyle(fontSize: 15),),
                          ],
                        )),
                  ),
                  SizedBox(height: 15,),
                  ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CAGR",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("94.15%",style: TextStyle(fontSize: 15,color: Color(0xFF1EC049)))
                      ],
                      ),
                    trailing: Container(
                      height: 25,
                      width:  70,
                      decoration: BoxDecoration(
                          color: index%2==0?Colors.redAccent:Colors.green,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: index%2==0?Text("High Risk",style: TextStyle(fontSize: 12,color: Colors.white),):
                      Text("Less Risk",style: TextStyle(fontSize: 12,color: Colors.white),)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      );
    }
  );
}