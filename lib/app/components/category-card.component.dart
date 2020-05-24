
import 'package:deliveryfood/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {

  final List categories;

  CategoryCard(this.categories);

  @override
  State<StatefulWidget> createState() => CategoryCardState(categories);

}

class CategoryCardState extends State<CategoryCard> {
  double offsetButton = 0;

  List categories = [];

  List<Category> values = [];

  String _selectedCategory;

  int selectedIndex = -1;

  CategoryCardState(this.categories) {
    mountCategories(this.categories);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  void mountCategories(List categories) {
    for ( int index = 0; index < categories.length; index++) {
        this.values.add(Category(categories.elementAt(index), selectedIndex: false, index: index ));
    }

  }

  @override
  Widget build(BuildContext context) {

    var borderRadius = BorderRadius.only(
      topLeft:  Radius.circular(30),
      topRight:  Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: values.length,
                scrollDirection: Axis.horizontal,
                //padding: EdgeInsets.only(right: 25, left: 25),
                //separatorBuilder: (context, index) => index + 1 < values.length ? Container(width: 20,) : null,
                separatorBuilder: (context, index) => Container(width: 10,),
                itemBuilder: (context, index) {
                  Category category =  values.elementAt(index);

                  if (selectedIndex != category.index) {
                    category.selectedIndex = false;
                  }

                  //print('mouting... ${this.offsetButton} ${category.selectedIndex} ${category.index}');
                  return Center(
                    child: InkWell(
                      onTap: () {
                          setState(() {

                            selectedIndex = index;
                            category.selectedIndex = !category.selectedIndex;

                            if (offsetButton == 0 && category.selectedIndex) {
                              this.offsetButton = (this.offsetButton * -1) + 3;
                            }

                            print('this.offsetButton ${this.offsetButton} ${category.selectedIndex} ${selectedIndex}');
                          });
                        },
                      child: Stack(
                          children: <Widget>[
                            Container(
                              width: category.selectedIndex ? 100 + offsetButton : 100,
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
                              width:category.selectedIndex ? 100 + offsetButton : 100,
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
                              left: category.selectedIndex ? offsetButton : 0,
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
                                          offset: Offset(category.selectedIndex ? offsetButton * -1 : 0,
                                              0), // shadow direction: bottom right
                                        )
                                      ]
                                  ),
                                  child: Text(category.label),
                                  //duration: Duration(milliseconds: 100),
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  );

                },
              )
          )
        ]
    );
  }

}

class Category {

  final int _index;
  final String _label;
  bool _selectedIndex;

  set selectedIndex(bool value) {
    _selectedIndex = value;
  }

  Category(label, {index, selectedIndex = false}) : this._label = label, this._index = index, this._selectedIndex = selectedIndex;

  bool get selectedIndex => _selectedIndex;

  String get label => _label;

  int get index => _index;

  @override
  String toString() {
    return 'Category{_index: $_index, _label: $_label, _selectedIndex: $_selectedIndex}';
  }
}
