import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_page extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'MyNhanTin',
            style: TextStyle(color: Color(0xFFFAFAF9)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Image.asset("assets/hihi.jpg"),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tên đăng nhập',
                  ),
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mật khẩu',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: Text("Đăng Nhập"),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/2');
                  },
                  child: Text(
                    "đăng kí tại đây",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                // Các trường đăng nhập và các phần tử khác có thể được thêm vào đây
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (_form.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim());
        Get.offAllNamed('/3');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
