// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "music_player",
    home: SafeArea(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Bar_1();
  }
}

class Bar_1 extends StatefulWidget {
  const Bar_1({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Bar_1();
  }
}

class _Bar_1 extends State<Bar_1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Weiget_1())),
              icon: const Icon(Icons.settings)),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

class Weiget_1 extends StatefulWidget {
  const Weiget_1({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Weiget_1();
  }
}

class _Weiget_1 extends State<Weiget_1> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SizedBox(
      width: 2000,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                //color: Colors.yellow,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"))),
            child: ListView(
              children: const [Text("I'm text")],
            ),
          ),
          const ListTile(
            title: Text("My page"),
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text("System Settings"),
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
    ));
  }
}
