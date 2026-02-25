import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas9flutter/list9.dart';
import 'package:wahyu_belajar_flutter/tugas9flutter/map9.dart';
import 'package:wahyu_belajar_flutter/tugas9flutter/model9.dart';

class Tugas9Screen extends StatefulWidget {
  const Tugas9Screen({super.key});

  @override
  State<Tugas9Screen> createState() => _Tugas9ScreenState();
}

class _Tugas9ScreenState extends State<Tugas9Screen> {
  int _currentindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void ontapItem(int index) {
    _currentindex = index;
    setState(() {});
  }

  void ontapItemDrawer(int index) {
    _currentindex = index;
    setState(() {});
    Navigator.pop(context);
  }

  static List<Widget> listWidget = [
    ListT9(),
    MapT9(),
    ModelT9()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 237, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 176, 176),
        title: Text("Tugas 9 ASEKK",
        style: TextStyle(
          fontSize: 36,
          color: Colors.white
        ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 209, 209)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/24/57/c2/2457c28d8e490fcff5be25ecf3ec7bf5.jpg",
                  )
              ),
              SizedBox(height: 15),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tugas 9 Flutter",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "List Model"
                )
              ],
              ),
              ],
              )),

              ListTile(
                leading: Icon(
                  Icons.check_box_rounded),
                title: Text(
                  "List",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),
                  onTap: () => ontapItemDrawer(0),
              ),

              ListTile(
                leading: Icon(
                  Icons.check_box_rounded),
                title: Text(
                  "List Map",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),
                  onTap: () => ontapItemDrawer(1),
              ),

              ListTile(
                leading: Icon(
                  Icons.check_box_rounded),
                title: Text(
                  "Model",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),
                  onTap: () => ontapItemDrawer(2),
              ),
          ],
        ),
      ),
       body: listWidget[_currentindex],
    );
  }
}