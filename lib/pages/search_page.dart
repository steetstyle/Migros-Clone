import 'package:flutter/material.dart';
import 'package:myapp/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [SearchBar()],
        ),
      ),
    );
  }
}
