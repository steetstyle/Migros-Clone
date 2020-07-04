import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/widgets/category_list_item.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Column(
                children: [
                  CategoryListItem(
                    imgSrc: 'assets/images/lolo_dog',
                    title: 'Et, Balık, Tavuk',
                    sub_categories: [Category('Tümünü Gör', () {})],
                    onPress: () => {},
                  ),
                  CategoryListItem(
                    imgSrc: 'assets/images/lolo_dog',
                    title: 'Süt Kahvaltılık',
                    onPress: () => {},
                  ),
                  CategoryListItem(
                    imgSrc: 'assets/images/lolo_dog',
                    title: 'Gıda, Şekerleme',
                    onPress: () => {},
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
