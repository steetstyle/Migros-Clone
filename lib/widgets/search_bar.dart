import 'package:flutter/material.dart';
import 'package:myapp/theme/constant.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();
  double _width = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.all(2),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              // to make elevation
              BoxShadow(
                color: Colors.black45,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
              // to make the coloured border
              BoxShadow(
                color: bottomBarColor,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                flex: 75,
                child: FocusScope(
                    child: Focus(
                        onFocusChange: (value) {
                          if (value) {
                            setState(() {
                              _width = 50;
                            });
                          } else {
                            setState(() {
                              _width = 0;
                            });
                          }
                        },
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(labelText: 'City'),
                        )))),
            AnimatedContainer(
                width: _width,
                duration: Duration(milliseconds: 500),
                child: IconButton(
                    icon: Icon(
                      Icons.fullscreen_exit,
                      size: _width / 2,
                    ),
                    onPressed: () {
                      _controller.clear();
                    })),
          ]),
        ),
      ),
    );
  }
}
