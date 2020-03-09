# five_star_rating

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


Flutter Package Rating
# five_star_rating
A rating package in a flutter
Five-star rating flutter package with hover effect
Examples
![one rating on hover]
<img src="https://raw.githubusercontent.com/gagsy/five_star_rating/master/vbadrating.png">
![two ratings on hover]
<img src="https://raw.githubusercontent.com/gagsy/five_star_rating/master/badrating.png">
![three ratings on hover]
<img src="https://raw.githubusercontent.com/gagsy/five_star_rating/master/goodrating.png">
![Four ratings on hover]
<img src="https://raw.githubusercontent.com/gagsy/five_star_rating/master/vgoodrating.png">
![Five ratings on hover]
<img src="https://raw.githubusercontent.com/gagsy/five_star_rating/master/excellect.png">
You can change the color of the start text hover background etc …
Also, I am sharing my code with you
Check Out the below links and check Please share your views and suggestion
five_star_rating | Flutter Package
A new Flutter package project.pub.dev
https://github.com/gagsy/five_star_rating
  
##How to use 
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rating=0;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
