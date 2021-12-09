# PROYEK AKHIR SEMESTER: B07

Link GitHub [Click Here](https://github.com/alfarisi17/b07uas.git)

Link APK [Click Here](https://github.com/alfarisi17/b07uas/releases)

---

Anggota Kelompok:

- Amelia Maharani Nurmalitasari - 2006596560
- Amira Husna Nur Adilah - 2006531825
- Caryn Hanuga - 2006596541
- Farrel Jordan - 2006596876
- Magnolia Fayza Zulkary - 2006596900
- Muhammad Ihsan Al Farisi - 2006596693
- Neiva Annur Syahistie - 2006531711

## Aplikasi & Manfaat

Pada masa pandemi ini, perjalanan wisata ke luar negeri menjadi terbatas karena banyaknya persyaratan yang harus
dipenuhi. Aplikasi ini dibuat untuk memudahkan masyarakat yang ingin melakukan perjalanan ke luar negeri, yaitu dengan
memberikan berbagai informasi yang diperlukan. Informasi yang tersedia pada aplikasi ini adalah statistik Covid-19 di
negara destinasi, informasi regulasi terhadap wisatawan, lokasi swab terdekat, informasi hotel karantina, dan artikel
yang berkaitan dengan travelling, terutama saat pandemi. aplikasi ini juga menyediakan sebuah support page di mana user
dapat memberikan kritik dan saran kepada pihak regulasi bandara lokal yang dikelola PT Angkasa Pura, serta mengetahui
kontak pihak penanganan Covid-19 di daerah tujuan. Dengan menggunakan aplikasi all-in-one information ini, pengguna yang
ingin melakukan perjalanan ke luar negeri dapat menemukan seluruh informasi yang dibutuhkan dan mempersiapkan
perjalanannya secara baik.

## Modul


### Laman utama (Beranda) & Sign Up/Login

Seperti pada umumnya, beranda utama akan menampilkan kalimat pembuka yang akan menyambut para user. Selain itu, di dalamnya juga akan terdapat data statistik covid-19 dalam skala dunia, data tersebut akan diambil dari JSON yang digunakan juga pada website tugas tengah semester. Setelah itu terdapat penjelasan fitur dan feedback user, yang keduanya merupakan models yang nanti juga akan dilakukan pemanggilannya dari website tugas tengah semester.

### Statistika Covid-19 di Daerah Tujuan

Modul ini berisikan informasi statitik COVID-19 pada berbagai negara yang dapat disimpan oleh pengguna pada akunnya masing-masing. Integrasi webs ervice pada modul ini akan dilakukan dengan pemanggilan objek country yang berelasi dengan akun pengguna dalam laman JSON.

### Info Regulasi Wisatawan di Daerah Tujuan

Modul ini berisikan informasi mengenai regulasi Covid-19 dari berbagai negara destinasi wisatawan di luar negeri (pada tugas ini baru terdapat tiga negara). Untuk mengintegrasikan modul ini dengan web service atas halaman web sebelumnya, akan dilakukan pemanggilan objek dari laman JSON pada halaman web yang telah dibuat.

### “Get Swabbed!”: Info lokasi layanan swab terdekat


### Info hotel karantina di Indonesia

Laman informasi hotel karantina memuat rekomendasi hotel-hotel karantina terbaik yang dapat ditempati oleh wisatawan saat menuju atau sepulang dari negara tujuannya. Integrasi dengan web service berupa pemanggilan objek hotel dalam laman JSON yang terdapat pada halaman web sebelumnya.

### Support Page
Laman bantuan ini diperuntukkan untuk pengajuan berbagai keluhan terkait penyelewenengan protokol COVID-19 bagi para user. Secara umum, akan terdapat formulir pengisian keluhan yang dapat diakses oleh user, yang disampaikan dan kemudian harapannya akan dapat dijadikan masukan kepada pihak berwajib pada negara tersebut. Di dalamnya terdapat bentuk pemanggilan API, dari data eksternal JSON. Kemudian integrasinya modul ini dengan web service atas halaman web sebelumnya, juga akan dilakukan pemanggilan objek yang merupakan models yang nanti juga akan dilakukan pemanggilannya dari website tugas tengah semester.

### Laman artikel
