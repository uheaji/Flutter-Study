import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ["신짱구", "신짱아", "봉미선"];
  var favorite = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
            setState(() {
              a++;
            });
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
          // shape: Border(
          //   bottom: BorderSide(
          //     color: Colors.black12,
          //   ),
          // ),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomNav(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            print(index);
            return ListTile(
              leading: Text(favorite[index].toString()),
              title: Text(name[index]),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    favorite[index]++;
                  });
                },
                child: Text("좋아요"),
              ),
            );
          },
        ),
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
