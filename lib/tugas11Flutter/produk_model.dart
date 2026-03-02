import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdukModel {
  final int? id;
  final String nama;
  final String telepon;
  final String alamat;
  final String produk;
  ProdukModel({
    this.id,
    required this.nama,
    required this.telepon,
    required this.alamat,
    required this.produk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'telpon': telepon,
      'alamat': alamat,
      'produk': produk,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      telepon: map['telpon'] as String,
      alamat: map['alamat'] as String,
      produk: map['produk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
