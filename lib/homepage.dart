import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];
  bool _isloading = true;

  Future _getdata() async{
    try {
      final response = await http.get(Uri.parse("http://192.168.50.56/wine/read.php"));
      if(response.statusCode==200){
        // print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _isloading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_listdata);
    super.initState();
  }
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Home")),
  //     body: _isloading ? Center(child: CircularProgressIndicator(),): ListView.builder(
  //       itemCount: _listdata.length,
  //       itemBuilder: ((context, index){
  //         return Card(
  //           child: ListTile(
  //             title: Text(_listdata[index]['CodeWine']),
  //             subtitle: Text(_listdata[index]['NameWine']),
  //           )
  //           ,
  //         );
  //       })
  //       ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            // appBar(),
            // Image.asset("images/shoe_blue.png",)
            hero(),
            Property(),
            subTitle(),
            category(),
            space(),
            descriptions(),
            space(),
            tasteNotes(),
            space(),
            foodPairing(),
            space(),
            review(),
          ],
        ),
      ),
      floatingActionButton: 
      Padding(padding: EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: 400,
        height: 50,
        child: 
          FloatingActionButton.extended(
            onPressed: () {},
            // icon: Icon(Icons.save),
            label: Text("Add to Cart"),
          ),
      )
      )
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget appBar(){
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("images/back_button.png"),
          // Container(
          //   child: Column(
          //     children: <Widget>[
          //       Text("WINE",style: TextStyle(
          //           fontWeight: FontWeight.w100,
          //           fontSize: 14
          //       ),),
          //       Text("Smiths Shoes", style: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold,
          //           color: Color(0xFF2F2F3E)
          //       ),),
          //     ],
          //   ),
          // ),
          // Image.asset("images/bag_button.png", width: 27, height: 30,),
        ],
      ),
    );
  }

  Widget hero(){
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset("images/wine3.jpg",height: 500), //This
          // should be a paged
          // view.
          Positioned(child: appBar(),top: 0,),
          Positioned(child: FloatingActionButton(
              elevation: 2,
              child:Image.asset("images/heart_icon_disabled.png",
                width: 30,
                height: 30,),
              backgroundColor: Colors.white,
              onPressed: (){}
          ),
            bottom: 0,
            right: 20,
          ),

        ],
      ),
    );
  }

  var description =
    Container(child: Text(
      "A style icon gets some love from one of today's top trendsetters. Pharrell Williams puts his creative spin on these shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
    ),
    );

  Widget Property(){
      return Container(
        padding: EdgeInsets.only(left: 16, bottom: 10, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("\$50", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Row(
              children: <Widget>[
                Text("Lupi Rezerva", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),),
            ],)
          ],
        ),
        Column(
          children: <Widget>[
            Text("Rating"),
            Container(
              child: Row(
                children: [
                  Image.asset("images/star.png",height: 15),
                  Text("4.6",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F2F3E)
                    ),
                  )
                ],
              ),
            ) //This
          ],
        ),
      ],
      ),
    );
  }

  Widget subTitle(){
    return Container(
      padding: EdgeInsets.only(left:16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Text("This vintage rates better than any other year for this wine",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
        ],
      ),
    );
  }

  Widget category(){
    return Container(
      padding: EdgeInsets.only(left:16),
      child: 
        Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(5.0),  
                  ),  
              color: Colors.blueGrey[50],  
              elevation: 4,  
              child: Center(
                child: Padding(padding: EdgeInsets.all(5),
                child: 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Grape",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                    ],
                  ),
                )
              )
            ),
            Card(
              shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(9.0),  
                  ),  
              color: Colors.blueGrey[50],  
              elevation: 4,  
              child: Center(
                child: Padding(padding: EdgeInsets.all(5),
                child: 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Primitivo di Manduria",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                    ],
                  ),
                )
              )
            ),
            Card(
              shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(9.0),  
                  ),  
              color: Colors.blueGrey[50],  
              elevation: 4,  
              child: Center(
                child: Padding(padding: EdgeInsets.all(5),
                child: 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Moldova",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                    ],
                  ),
                )
              )
            ),
          ],
        )
    );
  }

  Widget space(){
    return new Container(
      margin: EdgeInsets.only(bottom: 16, top: 16),
      height: 30.0,
      width: double.infinity,
      color: Colors.grey[100],
    );
  }

  Widget descriptions(){
    return Container(
      // alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          description,
          const SizedBox(height: 9,),
          Row(
            children: [
              Text("Aging: ", style: TextStyle(height: 1.5, color: Color(0xFF6F8398))),
              Text("12 months in used French Oak barrels", textAlign: TextAlign.justify,),
            ],
          ),
          const SizedBox(height: 9,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
              Text("Type: ", style: TextStyle(height: 1.5, color: Color(0xFF6F8398),),),
              Text("Red Wine", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
              SizedBox(width: 150),
            Column(
              children: [
              Text("Alcohol: ", style: TextStyle(height: 1.5, color: Color(0xFF6F8398),),),
              Text("13.5%", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),),
            ],)
          ],),
          const SizedBox(height: 12,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
              Text("Decant: ", style: TextStyle(height: 1.5, color: Color(0xFF6F8398),),),
              Text("1 hour", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
            SizedBox(width: 150),
            Column(
              children: [
              Text("Serving: ", style: TextStyle(height: 1.5, color: Color(0xFF6F8398),),),
              Text("16-18 C", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),),
            ],)
          ],)
      ]),
    );
  }

  Widget tasteNotes(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        Text("Taste Notes", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        Text("Deep red. Nose dominated by notes of ripe red fruit with some hints of strawberry jam and raspberry, combined with nuances of spice. So well integrated, there are notes of toasted barrels of high quality, giving a greedy character to wine, with aromas of vanilla and brioche. In the mouth, it confirms the fruity aromas in harmony with this structure but elegant.", textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398))),
            bar(),

      ]),
    );
  }

  Widget bar() {
    return Container(
      child: 
        Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.0,
                  leading: new Text("Light"),
                  trailing: new Text("Bold"),
                  percent: 0.2,
                  // center: Text("20.0%"),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.red[400],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.0,
                  leading: new Text("Smooth"),
                  trailing: new Text("Sweet"),
                  percent: 0.2,
                  // center: Text("20.0%"),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.red[400],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.0,
                  leading: new Text("Dry"),
                  trailing: new Text("Sweet"),
                  percent: 0.2,
                  // center: Text("20.0%"),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.red[400],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.0,
                  leading: new Text("Soft"),
                  trailing: new Text("Acidic"),
                  percent: 0.2,
                  // center: Text("20.0%"),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.red[400],
                ),
              ),
            ],
        )
    );
  }

  Widget foodPairing(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Text("Food Pairing", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text("Italian dishes, steak", textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
          const SizedBox(height: 9,),
      ]),
    ); 
  }

  Widget review(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          
          Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 9,),
          Column(
            children: [
              Row(
                children: [
                  Image.asset("images/user.png", height: 40,),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text("Moldova",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Just now",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),),
                    ],
                  ),
                  SizedBox(width: 230),
                  Row(
                    children: [
                      Image.asset("images/star.png",height: 15),
                      Text("4.6",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F2F3E)
                        ),
                      )

                ]),
                ]
              ),
              SizedBox(height: 9),
              Text("Highly qualitative. Blend of Cabernet Sauvignon, Saperavi and Merlot. Notes of black cherry, blackberry and plum and taste of oak. A bit sweet and spicy as an aftertaste. It has a high level of alcohol.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),)

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            height: 2.0,
            width: double.infinity,
            color: Colors.grey[100],
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset("images/user.png", height: 40,),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text("Moldova",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Just now",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),),
                    ],
                  ),
                  SizedBox(width: 230),
                  Row(
                    children: [
                      Image.asset("images/star.png",height: 15),
                      Text("4.6",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F2F3E)
                        ),
                      )

                ]),
                ]
              ),
              SizedBox(height: 9),
              Text("Highly qualitative. Blend of Cabernet Sauvignon, Saperavi and Merlot. Notes of black cherry, blackberry and plum and taste of oak. A bit sweet and spicy as an aftertaste. It has a high level of alcohol.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),)

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            height: 2.0,
            width: double.infinity,
            color: Colors.grey[100],
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset("images/user.png", height: 40,),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text("Moldova",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Just now",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),),
                    ],
                  ),
                  SizedBox(width: 230),
                  Row(
                    children: [
                      Image.asset("images/star.png",height: 15),
                      Text("4.6",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F2F3E)
                        ),
                      )

                ]),
                ]
              ),
              SizedBox(height: 9),
              Text("Highly qualitative. Blend of Cabernet Sauvignon, Saperavi and Merlot. Notes of black cherry, blackberry and plum and taste of oak. A bit sweet and spicy as an aftertaste. It has a high level of alcohol.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),)

            ],
          ),
      ]),
    ); 
  }
}
