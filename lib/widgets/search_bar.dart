import 'package:flutter/material.dart';
import 'package:myapp/theme/constant.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SearchBar extends StatefulWidget {
  SharedPreferences prefs;
  String storeKey;
  Function onSubmitted = (value) {};
  Function onTapSearchedItem = (value) {};
  Function onClean = () {};
  Function onChanged = (value) {};
  List<String> cached_search_list;

  asyncFunc() async {
    // Async func to handle Futures easier; or use Future.then
    prefs = await SharedPreferences.getInstance();
    cached_search_list = prefs.getStringList(storeKey);
    if (cached_search_list == null) {
      cached_search_list = [];
    }
  }

  SearchBar(
      {Key key,
      String storeKey,
      Function onSubmitted,
      Function onTapSearchedItem,
      Function onChanged,
      Function onClean}) {
    this.onSubmitted = (value) {
      onSubmitted(value);
    };

    this.onClean = () {
      onClean();
    };

    this.onChanged = (value) {
      onChanged(value);
    };

    this.onTapSearchedItem = (value) {
      onTapSearchedItem(value);
    };

    this.storeKey = storeKey;
    asyncFunc();
  }

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();
  double _width = 0;
  double heigth = 0;
  bool _isfocusedSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchbar(),
          SizedBox(height: 10),
          AnimatedContainer(
            height:
                _isfocusedSearchBar ? MediaQuery.of(context).size.height : 0,
            duration: Duration(milliseconds: 500),
            child: Column(
              children: [
                buildSearchTool(),
                AnimatedContainer(
                  width: _isfocusedSearchBar
                      ? MediaQuery.of(context).size.width
                      : 0,
                  duration: Duration(milliseconds: 250),
                  height: 1,
                  color: Colors.grey,
                ),
                if (widget.cached_search_list != null &&
                    widget.cached_search_list.length > 0)
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (String cached_search
                            in widget.cached_search_list.reversed)
                          buildCachedSearch(cached_search)
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildSearchTool() {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),
      height: _isfocusedSearchBar ? 50 : 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Arama Geçmisi",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                widget.prefs.remove(widget.storeKey);
                setState(() {
                  widget.cached_search_list = [];
                });
                widget.onClean();
              },
              child: Text("Geçmisi Temizle",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
            )
          ],
        ),
      ),
    );
  }

  Container buildSearchbar() {
    return Container(
      height: 47,
      width: double.infinity,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: bottomBarItemSelectedColor)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 10,
        ),
        buildInnerSearchInput(),
        buildCleanSearch(),
      ]),
    );
  }

  Expanded buildInnerSearchInput() {
    return Expanded(
        flex: 75,
        child: FocusScope(
            child: Focus(
                onFocusChange: (value) {
                  if (value) {
                    setState(() {
                      _width = 50;
                      _isfocusedSearchBar = true;
                    });
                  } else {
                    setState(() {
                      _isfocusedSearchBar = false;
                      _width = 0;
                    });
                  }
                },
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                  onSubmitted: (String value) {
                    if (value.length > 0) {
                      if (widget.cached_search_list.length >= 7) {
                        widget.cached_search_list.removeAt(0);
                      }
                      widget.cached_search_list.add(value);
                      widget.prefs.setStringList(
                          widget.storeKey, widget.cached_search_list);
                      setState(() {
                        widget.cached_search_list = widget.cached_search_list;
                        _isfocusedSearchBar = false;
                      });
                      widget.onSubmitted(value);
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Ara',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                ))));
  }

  AnimatedContainer buildCleanSearch() {
    return AnimatedContainer(
        width: _width,
        duration: Duration(milliseconds: 500),
        child: IconButton(
            icon: Icon(
              Icons.fullscreen_exit,
              size: _width / 2,
            ),
            onPressed: () {
              _controller.clear();

              widget.onClean();
            }));
  }

  AnimatedContainer buildCachedSearch(String cached_search) {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),
      height: _isfocusedSearchBar ? 40 : 0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: InkWell(
              onTap: () {
                widget.onTapSearchedItem(cached_search);
              },
              child: Text(cached_search)),
        ),
      ),
    );
  }
}
