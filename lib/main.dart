// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:core';
import 'package:http/http.dart' as http;

const String testImage = "https://www.itying.com/images/flutter/2.png";

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); // Create a gobal context for Navigator
// void main() {
//   runApp(const MaterialApp(
//     title: "music_player",
//     home: SafeArea(
//       child: MyApp(),
//     ),
//   ));
//   if (Platform.isAndroid) {
//     // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//     SystemUiOverlayStyle systemUiOverlayStyle =
//         const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//   }
// }

void main(List<String> args) {
  runApp(const MyApp());
  if (Platform.isAndroid) {
// 关于状态栏沉浸只要吧SafeArea去掉就行
//     // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const test_MainPageBar();
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
  final GlobalKey<ScaffoldState> open = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 一个全局的contaxt(Navigator路由返回)
      navigatorKey: navigatorKey,
      home: Scaffold(
        key: open,
        appBar: PreferredSize(
          // 定义appbar高度
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leading: IconButton(
              // 以按钮的方式触发Drawer_1
              onPressed: () => open.currentState!.openDrawer(),
              // '!'防止Dart空安全报错
              icon: const Icon(Icons.settings),
            ),
          ),
        ),
        drawer: const Drawer_1(),
        body: const MainPage(),
      ),
    );
  }
}

class test_MainPageBar extends StatefulWidget {
  const test_MainPageBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _test_MainPageBar();
  }
}

class _test_MainPageBar extends State<test_MainPageBar> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: CustomScrollView(
    //   slivers: <Widget>[
    //     SliverAppBar(
    //       leading: IconButton(
    //         onPressed: () => print("passed!"),
    //         icon: const Icon(Icons.settings),
    //       ),
    //       expandedHeight: 200.0,
    //       flexibleSpace: FlexibleSpaceBar(
    //         background: Image.network(testImage),
    //       ),
    //     )
    //   ],
    // ));

    return const test_Code();
  }
}

class test_Code extends Scaffold {
  const test_Code({Key? key}) : super(key: key);
  @override
  Widget? get body => CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text("标题"),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
        ],
      );
}

// leading: IconButton(
//             onPressed: () => open.currentState!.openDrawer(),
//             icon: Icon(Icons.settings))

// class MyApp extends StatelessWidget {
//   @override  Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Example',
//       home: Scaffold(
//         appBar: PreferredSize( //外面套一个PreferredSize
//           preferredSize: Size.fromHeight(50.0), // 设置高度
//           child: AppBar( //这个是原本的AppBar内容
//             // ...
//           )
//         ),
//         body: // ...
//       )
//     );
//   }}
// class Bar2 extends AppBar {}

class Drawer_1 extends Drawer {
  const Drawer_1({Key? key}) : super(key: key);

  @override
  Widget? get child => SizedBox(
        width: 20,
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              // decoration: BoxDecoration(
              //     //color: Colors.yellow,
              //     image: DecorationImage(
              //         image: NetworkImage(
              //             "https://www.itying.com/images/flutter/2.png"))),
              // child: ListView(
              //   children: const [Text("I'm text")],
              // ),
              child: UserAccountsDrawerHeader(
                accountName: Text("A"),
                accountEmail: Text("this is email"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.itying.com/images/flutter/2.png'),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 99, 57, 1),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.itying.com/images/flutter/2.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ListTile(
              title: const Text("My page"),
              leading: const CircleAvatar(
                  //child: Icon(Icons.people),
                  child: Icon(Icons.people)),
              //onTap: () => print("touched!"),
              onTap: () {
                Navigator.pop(navigatorKey.currentState!.context, "fuck!");
              },
            ),
            const Divider(
              color: Colors.red,
            ),
            const ListTile(
              title: Text("System Settings"),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
            const Divider(),
            const ListTile(
                title: Text("About"),
                leading: CircleAvatar(
                  child: Icon(Icons.access_alarm_outlined),
                  backgroundColor: Colors.pink,
                )),
          ],
        ),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => print("a"), icon: const Icon(Icons.ac_unit))
      ],
    );
  }
}

class Weiget_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Weiget_2();
  }
}

class _Weiget_2 extends State<Weiget_2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
    throw UnimplementedError();
  }
}

// String netWork_data() {
//    http.get("")
//   return
// }
