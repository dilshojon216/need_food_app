import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_food_app/presentation/widgets/logo_widget.dart';

Widget homeAppBar(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 90,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logoWidget(),
        Container(
          margin: const EdgeInsets.only(top: 25, right: 10),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/images/Vector.png'),
        ),
      ],
    ),
  );
}
