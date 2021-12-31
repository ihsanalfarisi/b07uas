class Hotel {
  final String? namaHotel;
  final String? foto;
  final String? harga;
  final String? country;

  Hotel._({this.namaHotel, this.foto, this.harga, this.country});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel._(
      namaHotel: json['fields']['nama_hotel'],
      foto: json['fields']['foto'],
      harga: json['fields']['harga'],
      country: json['fields']['country'],
    );
  }
}
