import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:on_boarding_screen/page_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<OnBoardItems> oi = [];
  int slideIndex = 0;
  PageController controller = PageController();
  @override
  void initState() {
    oi = OnBoardingItemData.loadOnBoardignItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            slideIndex = index;
          });
        },
        itemCount: oi.length,
        itemBuilder: (context, index) {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: oi[index].color,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  slideIndex == 0
                      ? Text('')
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton
                            (
                              onPressed: () {
                                controller.animateToPage(2,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 18.0),
                              ),
                            )
                          ],
                        ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset(
                      oi[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    oi[index].title,
                    style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    oi[index].subtitle,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  slideIndex == 2
                      ? OutlineButton(
                          onPressed: () {},
                          borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                              width: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text('Get Stated',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.red)),
                        )
                      : Text(''),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: oi.length,
                      itemBuilder: (context, i) {
                        return Container(
                            width: 30,
                            decoration: BoxDecoration(
                                color: index == i ? Colors.red : Colors.yellow,
                                shape: BoxShape.circle));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      slideIndex == 0 || slideIndex == 2
                          ? Text('')
                          : FlatButton(
                              onPressed: () {
                                controller.animateToPage(slideIndex - 1,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'Prev',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 18.0),
                              ),
                            ),
                      slideIndex == 2
                          ? Text('')
                          : FlatButton(
                              onPressed: () {
                                controller.animateToPage(slideIndex + 1,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 18.0),
                              ),
                            )
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}
