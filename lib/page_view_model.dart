import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardItems {
  final String title, subtitle, image;
  final Color color;

  OnBoardItems({this.image, this.subtitle, this.color, this.title});
}

class OnBoardingItemData {
  static List<OnBoardItems> loadOnBoardignItem() {
    List<OnBoardItems> items = [
      OnBoardItems(
          title: "Registration And Creating A Profile",
          subtitle: "This is Probably going to be the first step into"
              "your app and the first feature the user is going to interact with when they  open your app",
          image: "images/refer.jpg",
          color: Colors.white),
      OnBoardItems(
          title: "Search and Find Food Easily",
          subtitle:
              "After logging in and profile customization, the user is going to look for what they should eat",
          image: 'images/birthdaycake.jpg',
          color: Colors.white),
      OnBoardItems(
          title: "Checking The Restaurant Easily",
          subtitle:
              "Once the customer has found the restaurant they want to order from "
              "they need to be able to look at the restaurant profile",
          image: 'images/ballons.jpg',
          color: Colors.white)
    ];
    return items;
  }
}
