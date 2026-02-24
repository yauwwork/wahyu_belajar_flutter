import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TP7 extends StatefulWidget {
  const TP7({super.key});

  @override
  State<TP7> createState() => _TP7State();
}

TimeOfDay? seletedTime;

class _TP7State extends State<TP7> {

  String _formatTime(TimeOfDay time) {
  final now = DateTime.now();

  final dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  return DateFormat("hh:mm a").format(dateTime);
}

// String _formatTime(TimeOfDay time) {
//   final now = DateTime.now();
 
//   final DateTime = DateTime(
//     now.year,
//     now.month,
//     now.day,
//     time.hour,
//     time.minute,
//   );

//   return DateFormat("hh:mm a").format(datetime);
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      //   title: Text("Atur Pengingat",
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
            Text("Pilih Waktu Pengingat",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                ),

            ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context, 
                    initialTime: TimeOfDay.now()
                    );
                    if (picked != null) {
                      setState(() {
                        seletedTime = picked;
                      });
                    }
                },
                child: Text("Pilih jam"),
                ),
                 SizedBox(height: 12),      
          
          if (seletedTime != null)
            Text("Waktu Pengingat Disetel Pukul: ${_formatTime(seletedTime!)}",
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