import 'package:flutter/material.dart';
import 'package:myapp/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalkCard extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String location;
  final String member;
  final String orgBy;

  const WalkCard({
    Key key,
    this.imgSrc,
    this.title,
    this.location,
    this.member,
    this.orgBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: textWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 8,
                offset: Offset(3, 1))
          ],
        ),
        child: Container(
            width: 280,
            child: Column(
              children: <Widget>[
                Image.asset(imgSrc),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Icon(FontAwesomeIcons.mapMarkedAlt, size: 17),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          location,
                          style: contentBlack,
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Icon(FontAwesomeIcons.users, size: 17),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          member,
                          style: contentBlack,
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Icon(Icons.account_circle, size: 17),
                        SizedBox(
                          width: 15,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Oluşturan, ",
                                style: contentBlack,
                                children: <TextSpan>[
                              TextSpan(
                                  text: orgBy, style: TextStyle(color: primary))
                            ]))
                      ])
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
