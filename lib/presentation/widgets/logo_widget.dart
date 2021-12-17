import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget logoWidget() {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/burger 1.png",
          width: 40,
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: const [
              Text(
                "Need",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Food",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
