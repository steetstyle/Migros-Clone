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
                    category: Category('Kategori 1', 'assets/images/lolo_dog',
                        () {}, <Category>[
                      Category('Alt Kategori 1', 'assets/images/lolo_dog',
                          () {}, <Category>[
                        Category('Alt Alt Kategori 1', 'assets/images/lolo_dog',
                            () {}, <Category>[
                          Category('Alt Alt Alt Kategori 1',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 2',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 3',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 4',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                        ]),
                        Category('Alt Alt Kategori 2', 'assets/images/lolo_dog',
                            () {}, <Category>[]),
                        Category('Alt Alt Kategori 3', 'assets/images/lolo_dog',
                            () {}, <Category>[]),
                        Category('Alt Alt Kategori 4', 'assets/images/lolo_dog',
                            () {}, <Category>[
                          Category('Alt Alt Alt Kategori 1',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 2',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 3',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                          Category('Alt Alt Alt Kategori 4',
                              'assets/images/lolo_dog', () {}, <Category>[]),
                        ])
                      ]),
                      Category('Alt Kategori 2', 'assets/images/lolo_dog',
                          () {}, <Category>[]),
                      Category('Alt Kategori 3', 'assets/images/lolo_dog',
                          () {}, <Category>[])
                    ]),
                    depth: 1,
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
