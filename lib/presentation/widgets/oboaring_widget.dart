import 'package:flutter/material.dart';

List<Widget> onboaringWigdget(context) {
  List<Widget> list = [];
  pageString().forEach((element) {
    list.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          element.image!,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(element.title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Text(element.description!,
              style: const TextStyle(
                color: Color.fromRGBO(109, 109, 109, 1),
                fontSize: 20,
              )),
        ),
      ],
    ));
  });
  return list;
}

List<PageModel> pageString() {
  return [
    PageModel(
      image: "assets/images/Fast food 02 1.png",
      title: "Choose your\nfavorite menu",
      description: "There are many kinds of food \navailable here",
    ),
    PageModel(
      image: "assets/images/Fast food 02 1 (1).png",
      title: "Find \nthe best price",
      description: "There are many choices of \nfood menu here",
    ),
    PageModel(
      image: "assets/images/Fast food 02 1 (2).png",
      title: "Your food is ready \nto be delivered",
      description: "We will immediately send your \nfood warm - warm",
    ),
  ];
}

class PageModel {
  final String? image;
  final String? title;
  final String? description;

  PageModel({this.image, this.title, this.description});
}
