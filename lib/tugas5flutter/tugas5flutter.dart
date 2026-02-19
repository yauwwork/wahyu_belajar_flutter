import 'package:flutter/material.dart';

class Tugas5flutter extends StatefulWidget {
  const Tugas5flutter({super.key});

  @override
  State<Tugas5flutter> createState() => _Tugas5flutterState();
}

class _Tugas5flutterState extends State<Tugas5flutter> {

 bool showSellerName = false;
 bool isFavorite = false;
 bool showDetail = false;
 bool showStockInfo = false;
 int stockCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text("Katalog Agrova",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.all(16),
        
        //Elevated Button-----------------------------------------------------
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showSellerName = !showSellerName;
                });
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 105, 160, 255),
              ),
              child: Text("Tampilkan Detail Penjual", 
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
           ),
           if (showSellerName)
           Text("Nama Penjual : Imam\n"
           "Alamat Penjual : Yogyakarta\n"
           "No Wa : 081312344321",
           style: TextStyle(
            fontSize: 16,
            color: Colors.blueAccent,
           ),
           ),
        
           SizedBox(height: 12),
        
        //Icon Button-----------------------------------------------------------
        
           Padding(padding: EdgeInsetsGeometry.all(4),
           child: IconButton(
            icon: Icon(
              Icons.favorite,
            color: isFavorite? Colors.red : Colors.grey,
           ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
           ),
           ),
           if (isFavorite)
           Text(
            "Produk Ditambahkan ke Favorit!",
          style: TextStyle(color: Colors.red),
          ),
        
          SizedBox(height: 16),
        
          Padding(padding: EdgeInsetsGeometry.all(16),
          child: TextButton(
            onPressed: () {
              setState(() {
                showDetail = !showDetail;
             });
           },
           child: Text("Detail Produk",
           style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
           ),
           ),
          ),
          ),
          if (showDetail)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Ikan Bandeng 'Tanpa Duri', produk premium dibudidayakan langsung dengan profesional", textAlign: TextAlign.center,),
          ),
        
          //Ink Well Button
          Padding(padding: EdgeInsetsGeometry.all(16),
          child: InkWell( 
            splashColor: Colors.blue,
            onTap: () {
              setState(() {
                showStockInfo = !showStockInfo;
              });
              print("Klik untuk info stok!");
            },
            child: Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 222, 230,),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text("Klik untuk info stok!",
            style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          ),
          ),
          if (showStockInfo)
          Text("Stock Tersedia, Silahkan Lakukan Pemesanan",
           style: TextStyle(fontWeight: FontWeight.bold)
          ),

          SizedBox(height: 16),

          //Gesture Button
          
          Padding(padding: EdgeInsetsGeometry.all(16),
          child: Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Jumalah Produk $stockCounter",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
          ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                stockCounter ++;
              });
            },
            onDoubleTap: () {
             setState(() {
               stockCounter += 2;
             }); 
            },
            onLongPress: () {
              setState(() {
                stockCounter += 3;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Tambah Produk\n"
                "Tap 1x = + 1\n"
                "Tap 2x = + 2\n"
                "Long Press = + 3",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
          ),
          
    //Floating Button---------------------------------------------------------------------------

          Padding(padding: EdgeInsetsGeometry.all(16),
          child: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              setState(() {
                stockCounter -= 1;
              });
            },
            child: Icon(Icons.remove),
            )
          )
         ],
        ),
      ),
    );
  }
}