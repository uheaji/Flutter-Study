import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '연락처',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          // shape: Border(
          //   bottom: BorderSide(
          //     color: Colors.black12,
          //   ),
          // ),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomNav(),
        body: ListView(
          children: [
            UserItem(),
            UserItem(),
            UserItem(),
            UserItem(),
            UserItem(),
            UserItem(),
          ],
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.person_pin,
            size: 50,
          ),
          Text("홍길동"),
        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_rounded),
          label: '',
        ),
      ],
    );
  }
}
