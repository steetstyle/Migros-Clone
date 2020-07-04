import 'package:flutter/material.dart';
import 'package:myapp/theme/constant.dart';
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
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('${widget.title} pressed');
            setState(() {
              isSelected = !isSelected;
            });
            widget.onPress();
          },
          child: buildCategoryListItem(
              widget.imgSrc, widget.title, widget.onPress),
        ),
        if (widget.sub_categories != null)
          buildSubCategories(widget.sub_categories, isSelected)
      ],
    );
  }
}

Widget buildSubCategories(List<Category> sub_categories, bool _isSelected) {
  return AnimatedContainer(
    height: _isSelected == true ? 50.0 * sub_categories.length : 0,
    duration: Duration(milliseconds: 250),
    child: Column(
      children: <Widget>[
        for (var item in sub_categories) buildSubCategoryItem(item, _isSelected)
      ],
    ),
  );
}

InkWell buildSubCategoryItem(Category item, bool _isSelected) {
  return InkWell(
      onTap: () {
        print("${item.name} pressed");
        item.onPress();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: _isSelected ? 50 : 0,
        color: Colors.amber[100],
        child: Center(child: Text(item.name)),
      ));
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
