import 'dart:convert';

List<DataPenjual> dataPenjualFromJson(String str) => List<DataPenjual>.from(json.decode(str).map((x) => DataPenjual.fromJson(x)));

String dataPenjualToJson(List<DataPenjual> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPenjual {
    String? nama;
    String? alamat;
    String? produk;
    String? fotoProduk;

    DataPenjual({
        this.nama,
        this.alamat,
        this.produk,
        this.fotoProduk,
    });

    factory DataPenjual.fromJson(Map<String, dynamic> json) => DataPenjual(
        nama: json["Nama"],
        alamat: json["Alamat"],
        produk: json["Produk"],
        fotoProduk: json["Foto Produk"],
    );

    Map<String, dynamic> toJson() => {
        "Nama": nama,
        "Alamat": alamat,
        "Produk": produk,
        "Foto Produk": fotoProduk,
    };
}
