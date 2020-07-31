import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xhasasmall/Authentication/Register.dart';
import 'package:xhasasmall/Home/BusinessDetail.dart';
import 'package:xhasasmall/Home/Category.dart';
import 'package:xhasasmall/Models/Business.dart';
import 'package:xhasasmall/Services/api.dart';

//import 'package:xhasasmall/Services/api.dart';
import 'package:xhasasmall/Shared/Constants.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<String> words = [
    "aa",
    "bb",
    "cc",
    "dd",
    "ee",
    "ff",
    "gg",
    "hh",
    "ii"
  ]; // example

  List<Business> businesses = [
    Business(
        name: "Brenda's Salon",
        about: "We work with anything that has to do with hair",
        tag: "Salon",
        owner: "Brenda",
        contact: "Breanda@gmail.com"
        //url:"https://smallbiztrends.com/wp-content/uploads/2019/03/Hair-Salon-850x476.png"

        ),
    Business(
        name: "Kota Joe",
        about: "Food or nothing",
        tag: "Food",
        owner: "Joe",
        contact: "joe@gmail.com"
        //url:"https://www.eatout.co.za/wp-content/uploads/2016/01/Kota-Joe-12-600x450.jpg"
        ),
    Business(
        name: "fredsane",
        about: "we work with people who are currently in the friendzone",
        tag: "lonely",
        owner: "Freddy",
        contact: "freddy@gmail.com"
        // url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZJt0b4KECSuEFQxUxWY6g0qSjtvXx9HXvdg&usqp=CAU"
        ),
    Business(
        name: "warLords",
        about: "We are always ready for battle",
        tag: "War",
        owner: "Nkanyiso",
        contact: "nkanyiso@gmail.com"
        // url:"https://orhl.net/images/icon-warlords.jpg"
        ),
  ];
  dynamic Businesses;

  void initState() {
    // TODO: implement initState
    // Businesses = (api().fetchAll()).cast<Business>();
    api().fetchAll().then((value) {
      setState(() {
        Businesses = value;
      });

//      print(value[0].name);
      print("done");
    });
    super.initState();
  }

  final myController = TextEditingController(); // where we will get user input
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();//scaffold key [So that we can access this widget later on]
  @override
  Widget build(BuildContext context) {
    return Businesses == null
          ? Container(
             color:Colors.deepPurple,
            child: Center(
              child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            drawer: Container(
              margin: EdgeInsets.only(right: 100),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                      accountName: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text("Some Person"),
                      ),
                      accountEmail: Text("someEmail@myuct.ac.za"),
//
                    ),
                  ),
//                  Divider(
//                    color:Colors.black,
//                  ),
                  ListTile(
                    title: Text(
                        "Categories",
                      style:TextStyle(
                        color:Colors.grey,
                      )
                    ),
                    onTap: () {}

                  ),
                  ListTile(
                      title: Text("Cafe"),
                      onTap: () {
                        setState(() {
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Category(
                                      Businesses: Businesses,category:"Cafe")));
                        });
                      }

                  ),
                  ListTile(
                      title: Text("Beauty"),
                      onTap: () {
                        setState(() {
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Category(
                                      Businesses: Businesses,category:"Beauty")));
                        });
                      }

                  ),
                  ListTile(
                      title: Text("Health"),
                      onTap: () {
                        setState(() {
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Category(
                                      Businesses: Businesses,category:"Health")));
                        });
                      }

                  ),

                ],
              ),
            ),
            body: Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "Picture/background.png"
                      ),

                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                children: [
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(16),
                       child: GestureDetector(
                         onTap:(){
                           _scaffoldKey.currentState.openDrawer();
                         },
                         child: Icon(
                           Icons.menu,


                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(80, 20, 10,10),
                       child: Container(
                         height: 100,
                         width: 200,
                         color: Colors.white,
                         child: Image(
                           image: AssetImage("Picture/xhasaSmallLogo.jpg"),
                           fit: BoxFit.fill,
                         ),
                       ),
                     ),
                   ],
                 ),
//                Padding(
//                  padding: const EdgeInsets.all(20),
//                  child: Container(
//                    height: 100,
//                    width: 200,
//                    color: Colors.white,
//                    child: Image(
//                      image: AssetImage("Picture/xhasaSmallLogo.jpg"),
//                      fit: BoxFit.fill,
//                    ),
//                  ),
//                ),
                  Container(
                    height: 100,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 200,
                          child: TextFormField(
                            controller: myController,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Enter product/service"),
                          ),
                        ),
                        Container(
                          height: 60,
                          child: FlatButton(
                            child: Text("Search"),
                            onPressed: () {
                              print(
                                  "button clicked this is all she wrote ${myController.value.text}");
                              setState(() {
                                //Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              });
                            },
                            color: Colors.deepPurpleAccent[200],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    //So there is no overflow. allows grid to expand
                    child: GridView.builder(
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: Businesses.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "You have selected ${Businesses[index].name}");
                                  setState(() {
                                    //Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BusinessDetail(
                                                business: Businesses[index])));
                                  });
                                },
                                child: Text(
                                  Businesses[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text( Businesses[index].tag),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: 150,
                                  height: 100,
//                          child: Image(
//                            image:NetworkImage(businesses[index].url),
//                            fit:BoxFit.cover,
//                          ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }
}
