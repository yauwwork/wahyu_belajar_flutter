import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker7 extends StatefulWidget {
  const DatePicker7({super.key});

  @override
  State<DatePicker7> createState() => _DatePicker7State();
}

class _DatePicker7State extends State<DatePicker7> {

  DateTime? selectedDate;
  String _formatDate(DateTime date) {
    return DateFormat ("d MMMM yyyy"). format(date);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      //   title: Text("Pilih Tanggal",
      //   style: TextStyle(
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      //   ),
      // ),

      body: Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text("Pilih Tanggal Produksi",
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
                ),
                ),

        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000), 
              lastDate: DateTime(2030)
              );
              if (picked != null) {
                selectedDate = picked;
              }
          },
          child: Text('Pilih Tanggal')
          ),

          SizedBox(height: 12),      
          
          if (selectedDate != null)
            Text("Tanggal Produksi: ${_formatDate(selectedDate!)}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            )
          ],
        ),
      ),
    );
  }
}