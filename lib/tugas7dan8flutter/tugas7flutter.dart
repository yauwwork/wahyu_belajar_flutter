import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/checkbox.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/datepicker.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/dropdown.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/switch.dart';
import 'package:wahyu_belajar_flutter/tugas7dan8flutter/timepicker.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget> [
    CheckBox7(),
    Switch7(),
    DropDown7(),
    DatePicker7(),
    TP7(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
          ? "Syarat dan Ketentuan"
          :_selectedIndex == 1
          ? "Mode Gelap"
          : _selectedIndex == 2
          ? "Pilih Kategori Produk"
          :_selectedIndex == 3
          ? "Pilih Tanggal Produksi"
          : "Atur Pengingat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("")
              ),
              ListTile(
                leading: Icon(
                  Icons.check_box_rounded,
                  color: _selectedIndex == 0
                  ? Colors.blue
                  : Colors.grey,
                ),
                title: Text(
                  "CheckBox",
                  style: TextStyle(
                    color: _selectedIndex == 0
                    ? Colors.blue
                  : Colors.grey,
                  ),
                ),
                selected: _selectedIndex == 0,
                selectedTileColor: Colors.lightBlueAccent,
                onTap: () => _onItemTapped(0),
              ),

               ListTile(
                leading: Icon(
                  Icons.sunny,
                  color: _selectedIndex == 1
                  ? Colors.blue
                  : Colors.grey,
                ),
                title: Text(
                  "Switch",
                  style: TextStyle(
                    color: _selectedIndex == 1
                    ? Colors.blue
                  : Colors.grey,
                  ),
                ),
                selected: _selectedIndex == 1,
                selectedTileColor: Colors.lightBlueAccent,
                onTap: () => _onItemTapped(1),
              ),

               ListTile(
                leading: Icon(
                  Icons.arrow_drop_down_circle,
                  color: _selectedIndex == 2
                  ? Colors.blue
                  : Colors.grey,
                ),
                title: Text(
                  "DropDown",
                  style: TextStyle(
                    color: _selectedIndex == 2
                    ? Colors.blue
                  : Colors.grey,
                  ),
                ),
                selected: _selectedIndex == 2,
                selectedTileColor: Colors.lightBlueAccent,
                onTap: () => _onItemTapped(2),
              ),

               ListTile(
                leading: Icon(
                  Icons.calendar_today_rounded,
                  color: _selectedIndex == 3
                  ? Colors.blue
                  : Colors.grey,
                ),
                title: Text(
                  "DatePicker",
                  style: TextStyle(
                    color: _selectedIndex == 3
                    ? Colors.blue
                  : Colors.grey,
                  ),
                ),
                selected: _selectedIndex == 3,
                selectedTileColor: Colors.lightBlueAccent,
                onTap: () => _onItemTapped(3),
              ),

               ListTile(
                leading: Icon(
                  Icons.access_time_filled_rounded,
                  color: _selectedIndex == 4
                  ? Colors.blue
                  : Colors.grey,
                ),
                title: Text(
                  "TimePicker",
                  style: TextStyle(
                    color: _selectedIndex == 4
                    ? Colors.blue
                  : Colors.grey,
                  ),
                ),
                selected: _selectedIndex == 4,
                selectedTileColor: Colors.lightBlueAccent,
                onTap: () => _onItemTapped(4),
              ),
          ]
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: Colors.white,
    );
  }
}