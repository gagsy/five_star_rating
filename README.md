# five_star_rating
A rating package in flutter
Five star rating flutter package with hover effect

Examples

![one rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/vbadrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/badrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/goodrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/vgoodrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/exrating.png)

You can change the color of start text hover background etc ...



##How To Use

import 'package:flutter/material.dart';
import 'package:five_star_rating/five_star_rating.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double rating=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: <Widget>[
          FiveStarRating(
          allowHalfRating: true,
          onRatingChanged: (v) {
            rating = v;
           // print(rating);
            setState(() {});
          },
          //starCount: 5,
          intialrating: 1,
          size: 35.0,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          color: Colors.amber,
          borderColor: Colors.black,
          textColor: Colors.black,
          spacing:0.0
        ),
        ],
       
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

  

