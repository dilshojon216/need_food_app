import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_food_app/presentation/pages/signin_page.dart';
import 'package:need_food_app/presentation/widgets/logo_widget.dart';
import 'package:need_food_app/presentation/widgets/oboaring_widget.dart';

class OnboaringPage extends StatefulWidget {
  OnboaringPage({Key? key}) : super(key: key);

  @override
  _OnboaringPageState createState() => _OnboaringPageState();
}

class _OnboaringPageState extends State<OnboaringPage> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoWidget(),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: onboaringWigdget(context).length,
                  itemBuilder: (_, i) {
                    return onboaringWigdget(context)[i];
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: List.generate(
                        onboaringWigdget(context).length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (currentIndex < onboaringWigdget(context).length - 1) {
                        _controller!.animateToPage(
                          currentIndex + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      }
                    },
                    elevation: 2.0,
                    fillColor: const Color.fromRGBO(53, 182, 255, 1),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? const Color.fromRGBO(255, 137, 130, 1)
            : const Color.fromRGBO(255, 215, 212, 1),
      ),
    );
  }
}
