import 'package:flutter/material.dart';
import 'package:need_food_app/presentation/pages/chats_page.dart';
import 'package:need_food_app/presentation/pages/home_page.dart';
import 'package:need_food_app/presentation/pages/liked_page.dart';
import 'package:need_food_app/presentation/pages/profile_page.dart';

import 'shopping_cart_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  final List<Widget> _children = [
    HomePage(),
    LikedPage(),
    ShoppingCardPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              currentPage = ShoppingCardPage();
              currentTab = 2;
            });
          },
          child: Icon(
            Icons.shopping_cart_outlined,
            size: (currentTab == 2) ? 40 : 30,
            color: (currentTab == 2)
                ? const Color.fromRGBO(43, 178, 255, 1)
                : const Color.fromRGBO(109, 109, 109, 1),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentPage = HomePage();
                        currentTab = 0;
                      });
                    },
                    minWidth: 40,
                    child: Icon(
                      Icons.home_outlined,
                      size: (currentTab == 0) ? 40 : 30,
                      color: (currentTab == 0)
                          ? const Color.fromRGBO(43, 178, 255, 1)
                          : const Color.fromRGBO(109, 109, 109, 1),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentPage = LikedPage();
                        currentTab = 1;
                      });
                    },
                    minWidth: 40,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: (currentTab == 1) ? 40 : 30,
                      color: (currentTab == 1)
                          ? const Color.fromRGBO(43, 178, 255, 1)
                          : const Color.fromRGBO(109, 109, 109, 1),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentPage = ChatsPage();
                        currentTab = 3;
                      });
                    },
                    minWidth: 40,
                    child: Icon(
                      Icons.chat,
                      size: (currentTab == 3) ? 40 : 30,
                      color: (currentTab == 3)
                          ? const Color.fromRGBO(43, 178, 255, 1)
                          : const Color.fromRGBO(109, 109, 109, 1),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentPage = ProfilePage();
                        currentTab = 4;
                      });
                    },
                    minWidth: 40,
                    child: Icon(
                      Icons.person_outline_sharp,
                      size: (currentTab == 4) ? 40 : 30,
                      color: (currentTab == 4)
                          ? const Color.fromRGBO(43, 178, 255, 1)
                          : const Color.fromRGBO(109, 109, 109, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
