import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ["신짱구", "신짱아", "봉미선"];

  // context는 부모위젯의 정보를 담고있는 변수다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogUI();
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          '연락처',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person_pin),
            title: Text(name[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Contact"),
      content: Container(
        child: TextField(
          decoration: InputDecoration(labelText: "phone number"),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("취소"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("확인"),
        ),
      ],
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
