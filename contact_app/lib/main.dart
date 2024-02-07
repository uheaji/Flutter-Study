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
  var total = 3;
  var name = ["신짱구", "신짱아", "봉미선"];

  // 1. 부모에 수정함수 만들기
  addOne(addName) {
    setState(() {
      total++;
      name.add(addName);
    });
  }

  // context는 부모위젯의 정보를 담고있는 변수다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("추가"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              // 2. 자식위젯에 함수 보내기
              return DialogUI(addOne: addOne);
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          '연락처 (${total.toString()})',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: total,
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
  // 3. 등록하기
  DialogUI({super.key, this.addOne});
  final addOne;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Contact"),
      content: Container(
        child: TextField(
          controller: inputData,
          decoration: InputDecoration(labelText: "Name"),
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
          onPressed: () {
            addOne(inputData.text);
            Navigator.pop(context);
          },
          child: Text("완료"),
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
