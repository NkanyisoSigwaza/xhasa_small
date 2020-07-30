import 'package:flutter/material.dart';
import 'package:xhasasmall/Home/BusinessDetail.dart';

class Category extends StatefulWidget {
  dynamic Businesses;
  String category;


  Category({this.Businesses,this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  dynamic chosenBusinesses =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0;i<widget.Businesses.length;i++){
      print(widget.Businesses[i]);
      if(widget.category == widget.Businesses[i].tag){
        setState(() {

            chosenBusinesses.add(widget.Businesses[i]);

        });

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return chosenBusinesses==null ? Container(
      child: Text("No businesse fit that criteria"),
    ) :Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap:(){
                   // _scaffoldKey.currentState.openDrawer();
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
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Container(
//                  width: MediaQuery.of(context).size.width - 200,
//                  child: TextFormField(
//                    controller: myController,
//                    decoration: textInputDecoration.copyWith(
//                        hintText: "Enter product/service"),
//                  ),
//                ),
//                Container(
//                  height: 60,
//                  child: FlatButton(
//                    child: Text("Search"),
//                    onPressed: () {
//
//                    },
//                    color: Colors.deepPurpleAccent[200],
//                  ),
//                )
//              ],
//            ),
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
                itemCount: chosenBusinesses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(
                              "You have selected ${chosenBusinesses[index].name}");
                          setState(() {
                            //Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusinessDetail(
                                        business: chosenBusinesses[index])));
                          });
                        },
                        child: Text(
                          chosenBusinesses[index].name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text( chosenBusinesses[index].tag),
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

    );
  }
}
