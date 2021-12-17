import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:need_food_app/data/io_firstore_service.dart';
import 'package:need_food_app/models/categroya_model.dart';
import 'package:need_food_app/models/food_model.dart';
import 'package:need_food_app/presentation/widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IOFirstoreService _ioFirstoreService = IOFirstoreService();

  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeAppBar(context),
            _bunnerContier(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _categoriesContiner(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Popular Now",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _popularFood(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Recommended",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _recommended(),
          ],
        ),
      ),
    );
  }

  _categoriesContiner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 130,
      child: StreamBuilder<QuerySnapshot>(
        stream: _ioFirstoreService.getCategory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot document = documents[index];
              final Categoryas categoryModel =
                  Categoryas.fromSnapshot(document);
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(categoryModel.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      categoryModel.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  _bunnerContier() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: StreamBuilder<QuerySnapshot>(
        stream: _ioFirstoreService.getBanner(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView(
            controller: _pageController,
            children: snapshot.data!.docs.map((document) {
              return Image.network(
                document["bunner_image"],
                fit: BoxFit.fill,
              );
            }).toList(),
          );
        },
      ),
    );
  }

  _popularFood() {
    return Container(
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: StreamBuilder<QuerySnapshot>(
        stream: _ioFirstoreService.getFood(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot document = documents[index];
              final Foods food = Foods.fromSnapshot(document);
              return Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(food.foodImage!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      food.foodName!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      food.foodDescription!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      food.foodPrice! + "so'm",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  _recommended() {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: _ioFirstoreService.getFoodByCategory(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Container(
                  width: 230,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(document["image"]),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                  ));
            }).toList(),
          );
        },
      ),
    );
  }
}
