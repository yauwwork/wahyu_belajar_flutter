import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/tugas7flutter.dart';
import 'package:wahyu_belajar_flutter/tugas8flutter/tentangapps.dart';

class Home8 extends StatefulWidget {
  const Home8({super.key});

  @override
  State<Home8> createState() => _Home8State();
}

class _Home8State extends State<Home8> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Tugas7Flutter(),
    about8()
  ];

  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:  "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label:  "Tentang Aplikasi")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.blueAccent,
        onTap: _onItemTapped,
        ),
    );
  }
}