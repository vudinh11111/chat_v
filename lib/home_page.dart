import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_page> {
  GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  void openDraw() {
    _scaffoldstate.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: openDraw,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Tạo nhóm"),
                  value: "create",
                ),
                PopupMenuItem(child: Text("Tìm nhóm"), value: "search"),
              ];
            },
            onSelected: (value) {
              if (value == "create") {
              } else if (value == "search") {}
            },
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'Hello Mọi Người',
            style: TextStyle(color: Color(0xFFFAFAF9)),
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(children: [
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Xử lý khi Item 1 được chọn trong Drawer
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Xử lý khi Item 2 được chọn trong Drawer
          },
        ),
      ])),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
