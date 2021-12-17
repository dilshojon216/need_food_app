import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget splashWidget() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/burger 1.png",
          width: 100,
          height: 80,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: const [
              Text(
                "Need",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 40,
                  fontFamily: "Montserrat",
                ),
              ),
              Text(
                "Food",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
