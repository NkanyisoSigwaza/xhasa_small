import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhasasmall/Authentication/Register.dart';
import 'package:xhasasmall/Models/Business.dart';
import 'package:xhasasmall/Shared/Constants.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<String> words = ["aa","bb","cc","dd","ee","ff","gg","hh","ii"]; // example

  List<Business> businesses = [
    Business(
      name: "Brenda's Salon",
      url:"https://smallbiztrends.com/wp-content/uploads/2019/03/Hair-Salon-850x476.png"

    ),
    Business(
      name:"Kota Joe",
      url:"https://www.eatout.co.za/wp-content/uploads/2016/01/Kota-Joe-12-600x450.jpg"
    ),
    Business(
      name:"fredsane",
      url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZJt0b4KECSuEFQxUxWY6g0qSjtvXx9HXvdg&usqp=CAU"
    ),
    Business(
      name:"warLords",
      url:"https://orhl.net/images/icon-warlords.jpg"
    ),
  ];

  final myController = TextEditingController(); // where we will get user input
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
//      appBar: AppBar(
//        //title:Text("XhasaSmall"),
//        backgroundColor: Colors.deepPurpleAccent[200],
//        centerTitle: true,
//        leading: Container(
//          height:300,
//          width:100,
//          color:Colors.pinkAccent,
//          child: Image(
//            image:AssetImage("Picture/xhasaSmallLogo.jpg"),
//
//          ),
//        ),
//        actions: [
//          Container(
//            height:300,
//            width:100,
//            color:Colors.pinkAccent,
//            child: Image(
//              image:AssetImage("Picture/xhasaSmallLogo.jpg"),
//
//            ),
//          ),
//        ],
//      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height:100,
              width:200,
              color:Colors.white,
              child: Image(
                image:AssetImage("Picture/xhasaSmallLogo.jpg"),
                fit:BoxFit.fill,

              ),
            ),
          ),







          Container(
            height: 100,
            color:Colors.grey,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                width:MediaQuery.of(context).size.width -200,
                child: TextFormField(
                controller: myController,
                decoration: textInputDecoration.copyWith(hintText: "Enter product/service"),
                //initialValue: "Order Number",
            ),
              ),



                Container(
                  height:60,
                  child: FlatButton(
                    child: Text("Search"),
                    onPressed: (){
                      print("button clicked this is all she wrote ${myController.value.text}");
                      setState(() {
                        //Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register())
                        );
                      });
                    },
                    color:Colors.deepPurpleAccent[200],
                  ),
                )
              ],

            ),
          ),
          SizedBox(
            height:60,
          ),

          Expanded( //So there is no overflow. allows grid to expand
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: businesses.length,
                itemBuilder: (context,index){
                  return Column(
                    children:[
                      Text(
                          businesses[index].name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height:10,
                      ),
                      Expanded(
                        child: Container(
                          width:150,
                          height:100,
                          child: Image(
                            image:NetworkImage(businesses[index].url),
                            fit:BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:20,
                      ),
                    ],
                  );
                }),
          ),
//            Container(
//             color: Colors.white,
//
//             height: 60,
////            child: CircleAvatar(
////              backgroundImage: AssetImage("Picture/xhasaSmallLogo.jpg"),
////              radius: 150,
////            ),
//            child: Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 0),
//                child: Image(
//                  image:AssetImage("Picture/xhasaSmallLogo.jpg") ,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
//
//             width: MediaQuery.of(context).size.width,
//              //height:60,
//            ),

        ],


      ),
    );
  }
}
