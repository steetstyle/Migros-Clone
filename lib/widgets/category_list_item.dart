import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myapp/constant.dart';
import 'package:myapp/models/category.dart';

class CategoryListItem extends StatefulWidget {
  final String imgSrc;
  final String title;
  final Function onPress;
  final List<Category> sub_categories;

  CategoryListItem(
      {Key, key, this.imgSrc, this.title, this.onPress, this.sub_categories})
      : super(key: key);

  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('ss');
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPress();
      },
      child: Column(
        children: [
          buildCategoryListItem(widget.imgSrc, widget.title, widget.onPress),
          buildSubCategories(widget.sub_categories, isSelected)
        ],
      ),
    );
  }
}

Widget buildSubCategories(List<Category> sub_categories, bool _isSelected) {
  return AnimatedContainer(
    height: _isSelected == true ? 50.0 * 3.0 : 0,
    duration: Duration(milliseconds: 250),
    child: Column(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: _isSelected ? 50 : 0,
          color: Colors.amber[600],
          child: const Center(child: Text('Tümünü Gör')),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: _isSelected ? 50 : 0,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: _isSelected ? 50 : 0,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    ),
  );
}

Padding buildCategoryListItem(String imgSrc, String title, Function onPress) {
  return Padding(
    padding: const EdgeInsets.only(top: 2),
    child: Container(
        padding: EdgeInsets.all(5),
        height: 75,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                'assets/images/lolo_dog.png',
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                height: 100,
                child: Text(
                  "Et, Balık, Tavuk",
                  softWrap: true,
                  style: categoryItemStyle,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: bottomBarItemSelectedColor,
                ),
              ),
            ),
          ],
        )),
  );
}
