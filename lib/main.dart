import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myapp/pages/search_page.dart';
import 'package:myapp/theme/constant.dart';
import 'package:myapp/pages/category_page.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: appBackground),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<BottomNavigationBarItem> itemTabs = [
    buildBottomNavigationBarItem(Icon(Icons.home, size: 30), 'Anasayfa'),
    buildBottomNavigationBarItem(
        Icon(Icons.filter_list, size: 30), 'Kategoriler'),
    buildBottomNavigationBarItem(
        Icon(Icons.surround_sound, size: 30), 'Kampanyalar'),
    buildBottomNavigationBarItem(Icon(Icons.search, size: 30), 'Ürün Ara'),
    buildBottomNavigationBarItem(Icon(Icons.shopping_cart, size: 30), 'Sepetim')
  ];

  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    Center(
      child: Text("Kampanyalar"),
    ),
    SearchPage(),
    Center(
      child: Text("Sepetim"),
    ),
  ];

  List<AppBar> pagesAppBar = [
    AppBar(
      backgroundColor: white,
      leading: Image.asset('assets/images/lolo_dog.png'),
      actions: getActions(),
    ),
    AppBar(
      backgroundColor: white,
      centerTitle: true,
      title: Text(
        'Kategoriler',
        style: TextStyle(color: bottomBarColor),
      ),
      actions: getActions(),
    ),
    AppBar(
      backgroundColor: white,
      centerTitle: true,
      title: Text(
        'Kampayalar',
        style: TextStyle(color: bottomBarColor),
      ),
      actions: getActions(),
    ),
    AppBar(
      backgroundColor: white,
      centerTitle: true,
      title: Text(
        'Ürün Ara',
        style: TextStyle(color: bottomBarColor),
      ),
      actions: getActions(),
    ),
    AppBar(
      backgroundColor: white,
      centerTitle: true,
      title: Text(
        'Sepetim',
        style: TextStyle(color: bottomBarColor),
      ),
      actions: getActions(),
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: itemTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: bottomBarColor,
        selectedItemColor: bottomBarItemSelectedColor,
        unselectedItemColor: white,
      ),
    );
  }

  Widget getBody() {
    return pages.elementAt(selectedIndex);
  }

  AppBar getAppBar() {
    return pagesAppBar.elementAt(selectedIndex);
  }
}

List<Widget> getActions() {
  return <Widget>[
    buildAppBarButton(Icons.access_alarm),
    buildAppBarButton(Icons.account_circle)
  ];
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    Icon icon, String titleText) {
  return BottomNavigationBarItem(
      icon: icon,
      title: Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(titleText,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ));
}

Widget buildAppBarButton(IconData iconData) {
  return MaterialButton(
    height: 30,
    minWidth: 30,
    onPressed: () {},
    color: bottomBarColor,
    textColor: Colors.white,
    child: Icon(iconData, size: 25, color: Colors.white),
    padding: EdgeInsets.all(5),
    shape: CircleBorder(),
  );
}
