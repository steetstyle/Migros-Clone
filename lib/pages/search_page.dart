import 'package:flutter/material.dart';
import 'package:myapp/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchBar(
              storeKey: 'FurkaninListesi',
              onChanged: (value) {
                print("degişti");
              },
              onClean: () {
                print("temizlendi");
              },
              onSubmitted: (value) {
                print("Search Bar onSubmitted $value");
              },
              onTapSearchedItem: (value) {
                print("SearchBar onTapSearchedItem $value");
              },
            ),
          ],
        ),
      ),
    );
  }
}
