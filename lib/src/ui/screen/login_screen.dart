import 'package:direction/values/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:direction/src/methods/method_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(top: 150),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _buildTitle(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _buildLogin(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: const Text(
        "Sing In",
        style: TextStyle(
          color: KVioleta,
          fontWeight: FontWeight.w600,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Column(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Email",
                style: TextStyle(
                  color: KVioleta,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  color: KGray_L2, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black87),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Enter your email",
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(bottom: 10, top: 20),
          child: const Text(
            "Password",
            style: TextStyle(
              color: KVioleta,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
              color: KGray_L2, borderRadius: BorderRadius.circular(10)),
          child: TextField(
            obscureText: true,
            controller: password,
            decoration: const InputDecoration(
                icon: Icon(Icons.lock, color: Colors.black87),
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Enter your password",
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          alignment: Alignment.centerRight,
          child: FlatButton(
              onPressed: () {},
              child: const Text(
                "Nose mi contrasena?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              )),
        ),
        SizedBox(
          width: 1000,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: KVioleta,
            ),
            child: TextButton(
              onPressed: () {
                LoginPost(context, email.text, password.text);
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  color: KWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
