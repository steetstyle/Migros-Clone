import 'package:flutter/material.dart';
import 'package:myapp/theme/constant.dart';
import 'package:myapp/widgets/dog_card.dart';
import 'package:myapp/widgets/walk_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Hi Furkan",
                style: appTitle,
              ),
              SizedBox(height: 10),
              Text("Check out the new products, group, events, places and more",
                  style: contentBlack),
              SizedBox(
                height: 50,
              ),
              DogCard(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Walk Groups".toUpperCase(), style: rowTitleContent),
                  Text(
                    "See All",
                    style: rowTitleContent,
                  )
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    WalkCard(
                      title: 'Meet Our lovely dogs walking with us',
                      location: 'Türkiye, Istanbul',
                      member: '8 Kullanıcı',
                      orgBy: 'Furkan',
                      imgSrc: 'assets/images/card_dog_2.png',
                    ),
                    WalkCard(
                      title: 'Meet Our lovely dogs walking with us',
                      location: 'Türkiye, Istanbul',
                      member: '8 Kullanıcı',
                      orgBy: 'Furkan',
                      imgSrc: 'assets/images/card_dog_2.png',
                    ),
                    WalkCard(
                      title: 'Meet Our lovely dogs walking with us',
                      location: 'Türkiye, Istanbul',
                      member: '8 Kullanıcı',
                      orgBy: 'Furkan',
                      imgSrc: 'assets/images/card_dog_2.png',
                    ),
                    WalkCard(
                      title: 'Meet Our lovely dogs walking with us',
                      location: 'Türkiye, Istanbul',
                      member: '8 Kullanıcı',
                      orgBy: 'Furkan',
                      imgSrc: 'assets/images/card_dog_2.png',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
