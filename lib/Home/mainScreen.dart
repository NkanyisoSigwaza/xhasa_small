import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhasasmall/Shared/Constants.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<String> words = ["aa","bb","cc","dd","ee","ff","gg","hh","ii"]; // example

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
                itemCount: words.length,
                itemBuilder: (context,index){
                  return Column(
                    children:[
                      Text(words[index]),
                      Text("$index"),
                    ],
                  );
                }),
          ),
          Container(
          //  color: Colors.grey,

           height: 90,
//            child: CircleAvatar(
//              backgroundImage: AssetImage("Picture/xhasaSmallLogo.jpg"),
//              radius: 150,
//            ),
          child: Image(
            image:AssetImage("Picture/xhasaSmallLogo.jpg") ,
          ),

           width: MediaQuery.of(context).size.width/2,
            //height:60,
          )
        ],


      ),
    );
  }
}
