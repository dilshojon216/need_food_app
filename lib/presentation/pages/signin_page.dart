import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_food_app/data/auth_firebase_service.dart';
import 'package:need_food_app/presentation/pages/home_page.dart';
import 'package:need_food_app/presentation/pages/main_page.dart';
import 'package:need_food_app/presentation/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthFirebaseService _authFirebaseService = AuthFirebaseService();
  final _formKey = GlobalKey<FormState>();
  final emailTextEditController = TextEditingController();

  final passwordTextEditController = TextEditingController();

  chakedText() {
    if (emailTextEditController.text == "") {
      return ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter email")));
    } else if (passwordTextEditController.text == "") {
      return ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter password")));
    }
  }

  void singIn(String email, String password) async {
    var data = await _authFirebaseService.signInUser(email, password);
    if (data is UserCredential) {
      UserCredential userCredential = data as UserCredential;
      User user = userCredential.user!;
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            topPageContier(),
            centorPageContier(),
            bottomPageContier(),
          ],
        ),
      ),
    );
  }

  Widget topPageContier() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Rectangle 1.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [Image.asset("assets/images/Logo_Need_Food_1.png")],
      ),
    );
  }

  Widget centorPageContier() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg-image.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: emailTextEditController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(53, 182, 255, 1),
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  controller: passwordTextEditController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(53, 182, 255, 1),
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Forgot password ?",
                  style: TextStyle(
                    color: Color.fromRGBO(109, 109, 109, 1),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 25),
                  ),
                  onPressed: () {
                    chakedText();
                    buildLoading(context);
                    setState(() {
                      singIn(
                        emailTextEditController.text,
                        passwordTextEditController.text,
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(53, 182, 255, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        });
  }

  Widget bottomPageContier() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Text(
            "No account yet ?",
            style: TextStyle(
              color: Color.fromRGBO(109, 109, 109, 1),
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: const Text(
              "Sign up now",
              style: TextStyle(
                color: Color.fromRGBO(53, 182, 255, 1),
                fontSize: 18,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
