import 'package:deliveryfood/app/components/category-card.component.dart';
import 'package:deliveryfood/app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
              subtitle2: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              subtitle1: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: kGreenTextColor,
                fontSize: 24,
              ),
              bodyText1: TextStyle(
                  fontFamily: 'Montserrat',
                  color: kGreenTextColor,
                  fontSize: 24
              )
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              //side: BorderSide(color: Colors.red)
            ),
            textTheme: ButtonTextTheme.accent,
          )
        //fontFamily: 'Montserrat',
        //scaffoldBackgroundColor: kTextColor,
        //textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only( left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text('Deliver to ',
                          style: Theme.of(context).textTheme.subtitle1
                      ),
                    ), Container(
                      child: Text('Rondro Fulando de Tal as as das das',
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.apply(
                          bodyColor: Colors.black,
                        ).subtitle2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only( top: 20),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/icon-find.svg', width: 20,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only( left: 5),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Banana, maça',
                              hintStyle: TextStyle(fontSize: 14),
                              border: UnderlineInputBorder()
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20, left: 25),
                child: Text('Categories'),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: size.width,
                  height: 60,
                  child: CategoryCard(['Fruits', 'Meat', 'Vegetable']))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 90,
        width: size.width,
        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFF84C549),
                    borderRadius: BorderRadius.circular(18)
                ),
                child: ButtonTheme(
                    child: FlatButton(
                      onPressed: () {
                        print('pressed');
                      },
                      textColor: Colors.white,
                      /*disabledTextColor: Colors.white,*/
                      //textColor: Color(0xFFFFFFFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        //side: BorderSide(color: Colors.red)
                      ),
                      child: Text('ADD TO CART', style: TextStyle(
                          fontSize: 20
                      ),),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
