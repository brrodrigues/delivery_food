
import 'package:deliveryfood/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {

  final List categories;

  CategoryCard( this.categories);

  @override
  State<StatefulWidget> createState() => CategoryCardState(categories);

}

class CategoryCardState extends State<CategoryCard> {
  double offsetButton = 0;

  List categories;

  String _selectedCategory;

  CategoryCardState(this.categories);

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];

    var borderRadius = BorderRadius.only(
      topLeft:  Radius.circular(30),
      topRight:  Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    );

    print('categories ${categories}');

    /*
    var iterator = categories.iterator;

    bool hasNext = iterator.moveNext();

    while ( hasNext ) {
      String category = iterator.current;
      Widget newCategory = InkWell(
        borderRadius: borderRadius,
        onTap: () {
          setState(() {
            this.offsetButton = (this.offsetButton * -1) + 3;
            print(' offsetButton ${this.offsetButton}');
          });
        },
        child: Stack(
          children: <Widget>[ Container(
            width: 100 + offsetButton ,
            height: 50,
            decoration: BoxDecoration(
              //
              //border: Border.all(color: Colors.black, width: 1),
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: kGreenTextColor,
                  blurRadius: 0.0,
                  spreadRadius: 0,
                  //offset: Offset(offsetButton, 0), // shadow direction: bottom right
                )
              ],
            ),
          ),Container(
            width: 105 + offsetButton,
            height: 50,
            decoration: BoxDecoration(
              //
              //border: Border.all(color: Colors.black, width: 1),
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 0,
                  //offset: Offset(offsetButton, 0), // shadow direction: bottom right
                )
              ],
            ),
          ),
            Positioned(
              left: offsetButton,
              child: Material(
                elevation: 2,
                borderRadius: borderRadius,
                child: Container(
                  //margin: EdgeInsets.only(left: 1),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: borderRadius,
                      boxShadow: [
                        BoxShadow(
                          color: kGreenTextColor,
                          blurRadius: 0.0,
                          spreadRadius: 0,
                          offset: Offset(offsetButton * -1, 0), // shadow direction: bottom right
                        )]
                  ),
                  child: Text(category),
                  //duration: Duration(milliseconds: 100),
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                ),
              ),
            )
          ],
        ),
      );

      widgets.add(newCategory);

      hasNext = iterator.moveNext();

      if ( hasNext ) {
        widgets.add(Spacer());
      }
    }*/

    return Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: 25, left: 25),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          this.offsetButton = (this.offsetButton * -1) + 3;
                          print('this.offsetButton ${this.offsetButton}');
                        },
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 100 + offsetButton,
                                height: 40,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: borderRadius,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kGreenTextColor,
                                      blurRadius: 0.0,
                                      spreadRadius: 0,
                                      //offset: Offset(offsetButton, 0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                              ), Container(
                                width: 100 + offsetButton,
                                height: 40,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: borderRadius,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 0.0,
                                      spreadRadius: 0,
                                      //offset: Offset(offsetButton, 0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: offsetButton,
                                child: Material(
                                  elevation: 2,
                                  borderRadius: borderRadius,
                                  child: Container(
                                    //margin: EdgeInsets.only(left: 1),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: borderRadius,
                                        boxShadow: [
                                          BoxShadow(
                                            color: kGreenTextColor,
                                            blurRadius: 0.0,
                                            spreadRadius: 0,
                                            offset: Offset(offsetButton * -1,
                                                0), // shadow direction: bottom right
                                          )
                                        ]
                                    ),
                                    child: Text('category'),
                                    //duration: Duration(milliseconds: 100),
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 40,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    );
                  }
              )
          )
        ]
    );
  }


/*Container(
  width: 100 + offsetButton ,
  height: 50,
  child: Stack(
  children: <Widget>[ Container(
  width: 100 + offsetButton ,
  height: 50,
  decoration: BoxDecoration(
  //
  //border: Border.all(color: Colors.black, width: 1),
  borderRadius: borderRadius,
  boxShadow: [
  BoxShadow(
  color: kGreenTextColor,
  blurRadius: 0.0,
  spreadRadius: 0,
  //offset: Offset(offsetButton, 0), // shadow direction: bottom right
  )
  ],
  ),
  ),Container(
  width: 105 + offsetButton,
  height: 50,
  decoration: BoxDecoration(
  //
  //border: Border.all(color: Colors.black, width: 1),
  borderRadius: borderRadius,
  boxShadow: [
  BoxShadow(
  color: Colors.white,
  blurRadius: 0.0,
  spreadRadius: 0,
  //offset: Offset(offsetButton, 0), // shadow direction: bottom right
  )
  ],
  ),
  ),
  Positioned(
  left: offsetButton,
  child: Material(
  elevation: 2,
  borderRadius: borderRadius,
  child: Container(
  //margin: EdgeInsets.only(left: 1),
  decoration: BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: borderRadius,
  boxShadow: [
  BoxShadow(
  color: kGreenTextColor,
  blurRadius: 0.0,
  spreadRadius: 0,
  offset: Offset(offsetButton * -1, 0), // shadow direction: bottom right
  )]
  ),
  child: Text('category'),
  //duration: Duration(milliseconds: 100),
  alignment: Alignment.center,
  width: 100,
  height: 50,
  ),
  ),
  )
  ],
  ),
  ),*/



}
