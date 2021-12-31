// ignore_for_file: sort_constructors_first

class Hotel {
  final String? country;
  final String? namaHotel;
  final String? foto;
  final String? harga;
  final String? detail;

  Hotel._({this.country, this.namaHotel, this.foto, this.harga, this.detail});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel._(
      country: json['fields']['country'],
      namaHotel: json['fields']['nama_hotel'],
      foto: json['fields']['foto'],
      harga: json['fields']['harga'],
      detail: json['fields']['detail'],
    );
  }
}
