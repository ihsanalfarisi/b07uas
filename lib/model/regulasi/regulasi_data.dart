class Data {
  var country;
  var beforeArrival;
  var inArrival;
  var afterArrival;

  Data({
    this.country,
    this.beforeArrival,
    this.inArrival,
    this.afterArrival,
  });
}

List<Data> contents = [
  Data(
    country: 'Malaysia',
    beforeArrival: [
      'Semua wisatawan diwajibkan mengunduh, mengaktifkan, dan mendaftar aplikasi MySejahtera sebelum memasuki Malaysia.\n',
      'Tes RT-PCR sampel harus diambil dalam 3x24 jam sebelum keberangkatan.\n'
    ],
    inArrival: [
      'Perintah karantina (HSO) akan diberikan selama 14 hari dan wisatawan juga akan diberikan gelang khusus.\n',
      'Wisatawan akan diizinkan untuk dikarantina di rumah mereka sendiri atau akomodasi hotel.\n',
      'Kegagalan untuk mematuhi peraturan ini, pelaku akan dikenakan dua (2) tahun penjara atau sanksi denda.\n'
    ],
    afterArrival: [
      'Lakukan protokol kesehatan berikut ini:\n',
      '- Selalu gunakan masker di area umum.\n',
      '- Menjaga jarak setidaknya satu meter sepanjang waktu.\n',
      '- Cuci tangan secara rutin memakai sabun.\n',
    ],
  ),
  Data(
    country: 'Singapore',
    beforeArrival: [
      'Beberapa pilihan pengaturan perjalanan:\n',
      '- Air Travel Pass (ATP)\n',
      '- Connect@Singapore (Connect@SG)\n',
      '- Reciprocal Green Lane (RGL/Kunjungan Dinas dan Usaha)\n',
      '- Vaccinated Travel Lane (VTL)\n',
      'Lakukan pemeriksaan pra-keberangkatan.\n',
      'Tiga hari sebelum keberangkatan, Anda wajib untuk:\n',
      '- mendaftar dan membayar Tes Reaksi Berantai Polimerase (Polymerase Chain Reaction [PCR]) COVID-19\n',
      '- mengirimkan semua pernyataan kesehatan dan perjalanan pada SG Arrival Card melalui aplikasi Visit Singapore Travel Guide atau layanan digital SG Arrival Card (Kartu Kedatangan SG/SGAC)\n',
      '- mengunduh aplikasi TraceTogether dan daftarkan profil Anda\n',
      '- Wisatawan yang menggunakan Air Travel Pass maupun Reciprocal Green Lane untuk memasuki Singapura, diwajibkan untuk memesan penginapan di akomodasi yang telah disetujui pihak berwenang dan melakukan isolasi mandiri dengan waktu paling lama 48 jam sambil menunggu hasil Tes PCR COVID-19 saat kedatangan.\n',
      '- Pemegang Vaccinated Travel Lane pass diwajibkan untuk melakukan isolasi mandiri maksimal 24 jam di akomodasi residensial yang telah dinyatakan sebelumnya maupun akomodasi non-residensial yang memenuhi persyaratan, sambil menunggu hasil Tes PCR COVID-19 saat kedatangan.\n',
      '- Efektif sejak 29 Mei 2021 pukul 23:59, pengunjung wajib dan diharuskan menunjukkan hasil negatif dari tes PCR, terkecuali bagi mereka yang berasal dari negara/wilayah dengan risiko rendah terhitung dalam 21 hari terakhir sebelum memasuki Singapura.\n',
      'Memastikan Perlindungan Asuransi Perjalanan\n',
      'Wisatawan yang menggunakan Air Travel Pass, Reciprocal Green Lane dan Vaccinated Travel Lane harus memiliki perlindungan asuransi perjalanan sebelum bepergian ke Singapura.\n',
    ],
    inArrival: [
      'Tunjukkan dokumen kedatangan Anda\n',
      'Saat memasuki Singapura, Anda harus menunjukkan:\n',
      '- surat persetujuan untuk salah satu Safe Travel Lanes\n',
      '- visa yang valid (jika diperlukan)\n',
      '- perangkat mobile dengan aplikasi TraceTogether yang telah diunduh dan profil telah didaftarkan\n',
      '- Wisatawan yang menggunakan Air Travel Pass, Reciprocal Green Lane dan Vaccinated Travel Lane diwajibkan untuk menunjukkan salinan elektronik atau fisik polis asuransi yang berlaku.\n',
      '- Wisatawan dengan jalur Connect@Singapore dan Reciprocal Green Lane harus memperlihatkan hasil tes COVID-19 negatif yang dilakukan dalam waktu 72 jam sebelum keberangkatan. Wisatawan dengan jalur Vaccinated Travel Lane diwajibkan untuk memperlihatkan hasil tes COVID-19 negatif yang dilakukan dalam waktu 48 jam sebelum keberangkatan.\n',
      '- Wisatawan dengan jalur Reciprocal Green Lane juga harus memperlihatkan rencana perjalanan 14 hari dan bukti keberangkatan dari Singapura.\n',
      'Menjalankan Tes PCR Covid-19\n',
      'Semua wisatawan yang berkunjung dalam jangka waktu singkat harus menjalani Tes PCR COVID-19 saat kedatangan.\n',
      'Tetap aman dengan pelacakan kontak\n',
      'Unduh aplikasi TraceTogether dan terus nyalakan aplikasi tersebut selagi Anda berada di Singapura untuk memfasilitasi pelacakan kontak.\n',
    ],
    afterArrival: [
      'Lakukan protokol kesehatan berikut ini:\n',
      '- Selalu gunakan masker di area umum kecuali saat bersantap atau berolahraga.\n',
      '- Menjaga jarak setidaknya satu meter sepanjang waktu.\n',
      '- Bepergian dan interaksi dalam kelompok tidak boleh lebih dari 2 orang, berlaku mulai 27 September 2021.\n',
      '- Menuntaskan proses SafeEntry Anda melalui Aplikasi TraceTogether sebelum memasuki restoran, pusat belanja, dan pertokoan.\n',
      '- Pemeriksaan suhu tubuh dilakukan sebelum memasuki restoran, pusat belanja, dan pertokoan.\n',
    ],
  ),
  Data(
    country: 'Thailand',
    beforeArrival: [
      'Wisatawan yang sudah divaksinasi dapat tinggal di SHA+ Hotel di area Sandbox selama 7 hari dan harus menunjukkan dokumen berikut:\n',
      '- Thailand Pass\n',
      '- Sertifikat vaksin Covid-19\n',
      '- Reservasi SHA+ Hotel yang sudah terbayar selama 7 hari di area Sandbox\n',
      '- Polis asuransi kesehatan dalam bahasa Inggris yang mencakup biaya perawatan kesehatan dan pengobatan untuk Covid-19 tidak kurang dari 50,000 USD\n',
      '- Surat keterangan sehat dengan hasil laboratorium, dalam bahasa Inggris, yang menunjukkan bahwa Covid-19 tidak terdeteksi menggunakan tes RT-PCR\n',
      '- Reservasi penerbangan\n',
      '- Thai Visa\n',
    ],
    inArrival: ['test'],
    afterArrival: [
      'Wisatawan yang belum divaksinasi dapat melakukan karantina di Alternative Quarantine (AQ) Hotel selama 10 hari dan harus menunjukkan dokumen berikut:\n',
      '- Thailand Pass\n',
      '- Reservasi Alternative Quarantine (AQ) Hotel yang sudah terbayar selama 10 hari\n',
      '- Polis asuransi kesehatan dalam bahasa Inggris yang mencakup biaya perawatan kesehatan dan pengobatan untuk Covid-19 tidak kurang dari 50,000 USD\n',
      '- Surat keterangan sehat dengan hasil laboratorium, dalam bahasa Inggris, yang menunjukkan bahwa Covid-19 tidak terdeteksi menggunakan tes RT-PCR\n',
      '- Reservasi penerbangan\n',
      '- Thai Visa\n',
    ],
  )
];
