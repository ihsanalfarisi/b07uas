class Support {
  final String negara;
  final String lokasi;
  final String kejadian;
  final String keluhan;
  final String saran;

  Support(
      {required this.negara,
      required this.lokasi,
      required this.kejadian,
      required this.keluhan,
      required this.saran});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
        negara: json["fields"]["Negara_yang_dituju"],
        lokasi: json["fields"]["Lokasi_kejadian"],
        kejadian: json["fields"]["Kejadian_secara_umum"],
        keluhan: json["fields"]["keluhan"],
        saran: json["fields"]["saran"]);
  }
}