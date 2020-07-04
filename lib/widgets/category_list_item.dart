import 'package:flutter/material.dart';
import 'package:myapp/theme/constant.dart';
import 'package:myapp/models/category.dart';

class CategoryListItem extends StatefulWidget {
  final Category category;
  final int depth;

  CategoryListItem({Key, key, this.category, this.depth}) : super(key: key);

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
            print('${widget.category.name} pressed');
            setState(() {
              isSelected = !isSelected;
            });
            widget.category.onPress();
          },
          child:
              buildCategoryListItem(widget.category, widget.depth, isSelected),
        ),
        if (widget.category.sub_categories != null)
          buildSubCategories(widget.category.sub_categories, widget.depth + 1,
              isSelected, context)
      ],
    );
  }
}

Widget buildSubCategories(List<Category> sub_categories, int depth,
    bool _isSelected, BuildContext context) {
  return AnimatedContainer(
    height: sub_categories.length > 0 ? _isSelected ? null : 0 : 0,
    duration: Duration(milliseconds: 250),
    child: Column(
      children: <Widget>[
        for (var item in sub_categories)
          CategoryListItem(
            category: item,
            depth: depth + 1,
          )
      ],
    ),
  );
}

InkWell buildSubCategoryItem(Category item, int depth, bool _isSelected) {
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

Padding buildCategoryListItem(Category category, int depth, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(top: 2),
    child: Container(
        padding: EdgeInsets.all(5),
        height: 50,
        color: isSelected ? bottomBarItemSelectedColor : white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            for (var i = 0; i < depth + 1; i++)
              SizedBox(
                width: 10,
              ),
            if (category.imgSrc != null)
              Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  category.imgSrc,
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
                height: 50,
                child: Text(
                  category.name,
                  softWrap: true,
                  style: categoryItemStyle,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Icon(
                  category.sub_categories.length > 0
                      ? isSelected ? Icons.remove : Icons.add
                      : Icons.arrow_right,
                  color:
                      isSelected ? bottomBarColor : bottomBarItemSelectedColor,
                ),
              ),
            ),
          ],
        )),
  );
}
