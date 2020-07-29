import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<String> words = ["aa","bb","cc","dd","ee","ff","gg","hh","ii"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("XhasaSmall"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.,
        children: [

          Image(
            image: AssetImage("Picture/xhasaSmallLogo.jpg"),
            //t:BoxFit.fitHeight
          ),


          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              FlatButton(
                child: Text("Search"),
                onPressed: (){},
                color:Colors.deepPurple,
              )
            ],

          ),
          SizedBox(
            height:10,
          ),

          Expanded( //So there is no overflow. allows grid to expand
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: words.length,
                itemBuilder: (context,index){
                  return Card(
                    child:Text(words[index]),
                  );
                }),
          ),
          Container(
            color: Colors.grey,
//            child: Expanded(
//              child: Image(
//                image: AssetImage("Picture/xhasaSmallLogo.jpg"),
//                fit:BoxFit.fill,
//              ),
//            ),
            width: MediaQuery.of(context).size.width,
            height:60,
          )
        ],


      ),
    );
  }
}
