import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title:Text("XhasaSmall"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.,
        children: [




          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
              width:MediaQuery.of(context).size.width -100,
              child: TextFormField(
              controller: myController,
              decoration: textInputDecoration.copyWith(hintText: "Enter product/service"),
              //initialValue: "Order Number",
          ),
            ),



              FlatButton(
                child: Text("Search"),
                onPressed: (){
                  print("button clicked this is all she wrote ${myController.value.text}");
                },
                color:Colors.deepPurple,
              )
            ],

          ),
          SizedBox(
            height:30,
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
                          fontSize: 20
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
                    ],
                  );
                }),
          ),
          Container(
          //  color: Colors.grey,

           height: 75,
//            child: CircleAvatar(
//              backgroundImage: AssetImage("Picture/xhasaSmallLogo.jpg"),
//              radius: 150,
//            ),
          child: Image(
            image:AssetImage("Picture/xhasaSmallLogo.jpg") ,
            fit: BoxFit.cover,
          ),

           width: MediaQuery.of(context).size.width -150,
            //height:60,
          ),

        ],


      ),
    );
  }
}
