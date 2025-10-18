#let heading_level = state("heading_level", 0)
#let heading_text_indent = state("heading_text_indent", 0pt)

#show heading: it => {
  heading_level.update(it.level)
  let indent = 1.5em * (it.level - 1)
  let number_width = 3em
  let text_indent = indent + number_width
  heading_text_indent.update(text_indent)

  grid(
    columns: (indent, number_width, 1fr),
    "", // empty column for indentation
    counter(heading).display(),
    it.body
  )
}

#show par: it => context {
  let level = heading_level.get()
  if level > 0 {
    heading_level.update(0) // Reset
    let indent = heading_text_indent.get()
    block(inset: (left: indent), it)
  } else {
    it
  }
}

= BAB I – LAPORAN TEORI

== Operator Perbandingan (Relasional) dalam C++

=== Definisi dan Fungsi Operator Perbandingan

Operator perbandingan, atau operator relasional, adalah operator fundamental dalam C++ yang berfungsi mengevaluasi hubungan antara dua nilai atau ekspresi. Operator ini membandingkan nilai di sisi kiri dan kanan, lalu menghasilkan nilai boolean `true` (benar) atau `false` (salah). Di C++, `true` direpresentasikan sebagai `1` dan `false` sebagai `0`. Hasil operasi perbandingan ini sangat penting untuk pengambilan keputusan dalam program, terutama pada struktur kontrol seperti `if` dan `else`, di mana alur program bergantung pada hasil evaluasi kondisi. Contohnya, untuk menentukan kelulusan siswa, operator perbandingan memeriksa apakah nilai siswa lebih besar atau sama dengan standar kelulusan (misalnya, `nilai >= 70`). Jika kondisi terpenuhi, program akan menampilkan "Lulus", dan jika tidak akan menampilkan "Tidak Lulus". Hal ini memungkinkan program untuk bereaksi secara dinamis terhadap berbagai kondisi input atau data.

Operator perbandingan bekerja pada beragam tipe data, termasuk numerik (`int`, `float`, `double`) dan karakter (`char`). Namun, perbandingan tipe data _floating-point_ (bilangan desimal) bisa menghasilkan nilai yang tidak terduga karena masalah presisi. Oleh karena itu, tidak disarankan menggunakan operator `==` secara langsung untuk membandingkan dua nilai _floating-point_. Sebagai gantinya, lebih aman untuk memeriksa apakah nilai-nilai tersebut berada dalam kisaran toleransi yang bisa diterima. Misalnya, untuk membandingkan dua variabel `float` `a` dan `b`, lebih aman menulis `if (abs(a - b) < 0.0001)`, di mana `0.0001` adalah toleransi kesalahan. Pemahaman mendalam tentang cara kerja operator perbandingan dan potensinya sangat penting untuk menulis kode yang andal dan bebas dari _bug_.

=== Jenis-Jenis Operator Perbandingan

Bahasa C++ menyediakan enam operator perbandingan utama untuk membandingkan dua operand. Keenam operator ini memiliki fungsi yang berbeda namun saling melengkapi untuk membentuk kondisi yang spesifik. Berikut adalah tabel yang merangkum operator-operator tersebut beserta fungsinya:

#table(
  columns: 5,
  [*Operator*], [*Nama*], [*Fungsi*], [*Contoh*], [*Hasil*],
  [`==`], [Sama Dengan], [Memeriksa apakah kedua operand memiliki nilai yang sama.], [`5 == 5`], [`1` (true)],
  [`!=`], [Tidak Sama Dengan], [Memeriksa apakah kedua operand memiliki nilai yang berbeda.], [`5 != 3`], [`1` (true)],
  [`>`], [Lebih Dari], [Memeriksa apakah operand kiri lebih besar dari operand kanan.], [`10 > 5`], [`1` (true)],
  [`<`], [Kurang Dari], [Memeriksa apakah operand kiri lebih kecil dari operand kanan.], [`3 < 7`], [`1` (true)],
  [`>=`], [Lebih Dari atau Sama Dengan], [Memeriksa apakah operand kiri lebih besar atau sama dengan operand kanan.], [`8 >= 8`], [`1` (true)],
  [`<=`], [Kurang Dari atau Sama Dengan], [Memeriksa apakah operand kiri lebih kecil atau sama dengan operand kanan.], [`4 <= 6`], [`1` (true)],
)

_Tabel 1: Ringkasan Operator Perbandingan dalam C++_

==== Operator Sama Dengan (==)

Operator `==` (sama dengan) digunakan untuk membandingkan dua nilai apakah identik. Operator ini sering tertukar dengan `=`, yang merupakan operator penugasan. Perbedaan ini krusial: `=` memberi nilai pada variabel, sedangkan `==` membandingkan nilai. Jika kedua operand sama, ekspresi `==` menghasilkan `true` (1), dan jika berbeda, hasilnya `false` (0). Contohnya, `if (x == 10)` hanya akan dieksekusi jika nilai `x` adalah 10. Kesalahan penggunaan `=` dalam kondisi `if` (contoh: `if (x = 10)`) dapat menyebabkan bug yang sulit dideteksi, karena ekspresi tersebut akan selalu dianggap benar (karena nilai 10 dianggap `true`), sehingga blok `if` selalu dijalankan tanpa menghiraukan nilai awal `x`.

==== Operator Tidak Sama Dengan (!=)

Operator `!=` (tidak sama dengan) adalah kebalikan dari operator `==`. Operator ini menghasilkan `true` (1) jika kedua operand yang dibandingkan berbeda nilainya, dan `false` (0) jika nilainya sama. Operator ini berguna untuk memeriksa kondisi di mana suatu nilai tidak boleh sama dengan nilai tertentu. Contohnya, pada program autentikasi, `if (password != "admin123")` digunakan untuk mengecek jika kata sandi yang dimasukkan tidak cocok dengan kata sandi default. Jika kondisi ini terpenuhi, program bisa menolak akses. Penggunaan operator `!=` membuat logika program lebih ekspresif dan mudah dibaca, terutama saat menangani semua kasus kecuali satu nilai spesifik.

==== Operator Kurang Dari (<)

Operator `<` (kurang dari) membandingkan dua nilai dan menghasilkan `true` jika operand kiri lebih kecil dari operand kanan, jika tidak maka hasilnya `false`. Operator ini umum digunakan dalam perulangan `for` untuk mengontrol jumlah iterasi, contohnya `for (int i = 0; i < 10; i++)`, yang akan terus berjalan selama `i` kurang dari 10. Operator `<` juga dipakai dalam logika lain, seperti memvalidasi usia pengguna (`if (age < 13)`) atau untuk mengurutkan data, menjadikannya alat penting dalam berbagai algoritma dan struktur data.

==== Operator Lebih Dari (>)

Operator `>` (lebih dari) adalah kebalikan dari operator `<`. Operator ini menghasilkan `true` jika operand kiri lebih besar dari operand kanan, dan sebaliknya `false`. Seperti operator `<`, operator `>` juga punya banyak aplikasi praktis. Contohnya, pada sistem penilaian, `if (score > 90)` bisa digunakan untuk memberi nilai 'A' kepada siswa dengan nilai di atas 90. Operator ini juga sering dipakai dalam algoritma pencarian dan pengurutan, seperti mencari nilai maksimum dalam array atau untuk algoritma pengurutan berbasis perbandingan. Kombinasi operator `>` dan `<` sering dipakai untuk memeriksa apakah sebuah nilai berada dalam rentang tertentu, meskipun untuk kasus ini operator `>=` dan `<=` umumnya lebih efisien.

==== Operator Kurang Dari atau Sama Dengan (<=)

Operator `<=` (kurang dari atau sama dengan) akan menghasilkan `true` jika nilai operand kiri lebih kecil atau sama dengan nilai operand kanan. Operator ini pada dasarnya menggabungkan fungsi dari operator `<` dan `==`. Penggunaannya sangat umum, terutama dalam validasi rentang nilai. Contohnya, untuk memeriksa apakah nilai `x` berada dalam rentang 1 hingga 10 (inklusif), kita dapat menulis `if (x >= 1 && x <= 10)`. Dalam perulangan, operator ini juga sering digunakan, misalnya `for (int i = 1; i <= 10; i++)`, yang akan mengeksekusi blok perulangan untuk nilai `i` dari 1 hingga 10. Penggunaan operator `<=` dan `>=` membuat kode lebih ringkas dan mudah dipahami dibandingkan jika harus menggunakan kombinasi operator `<` dan `==`.

==== Operator Lebih Dari atau Sama Dengan (>=)

Operator `>=` (lebih dari atau sama dengan) menghasilkan `true` jika nilai operand kiri lebih besar atau sama dengan nilai operand kanan. Seperti halnya `<=`, operator ini menggabungkan dua kondisi sekaligus. Operator ini berguna untuk menetapkan batas bawah suatu nilai. Contohnya, pada program _e-commerce_, `if (totalPurchase >= 500000)` dapat digunakan untuk memberi diskon pada pelanggan dengan pembelian minimal Rp500.000. Operator `>=` memastikan bahwa pembelian dengan nilai pas Rp500.000 juga memenuhi syarat. Kombinasi keenam operator perbandingan ini memberikan fleksibilitas besar bagi pemrogram untuk membangun logika kondisional yang kompleks dan presisi sesuai kebutuhan program.

== Operator Logika dalam C++

=== Definisi dan Fungsi Operator Logika

Operator logika C++ adalah operator untuk menggabungkan atau memodifikasi ekspresi boolean (`true` atau `false`). Fungsi utamanya adalah membangun kondisi yang lebih kompleks dari beberapa kondisi sederhana, memungkinkan program membuat keputusan berdasarkan beberapa kriteria sekaligus. Sebagai contoh, program bisa memeriksa apakah pengguna sudah login _dan_ memiliki izin admin menggunakan operator `&&` (AND) sebelum memberikan akses. Hasil dari operasi logika ini adalah nilai boolean yang kemudian digunakan oleh struktur kontrol seperti `if` untuk menentukan alur program. Operator ini sangat penting untuk menciptakan program yang responsif dan dapat membuat keputusan berdasarkan berbagai skenario yang mungkin terjadi saat runtime.

=== Jenis-Jenis Operator Logika

#table(
  columns: 5,
  [*Operator*], [*Nama*], [*Fungsi*], [*Contoh*], [*Hasil*],
  [`&&`], [Logika AND], [Menghasilkan `true` jika kedua operand bernilai `true`.], [`true && false`], [`false`],
  [`||`], [Logika OR], [Menghasilkan `true` jika salah satu atau kedua operand bernilai `true`.], [`true || false`], [`true`],
  [`!`], [Logika NOT], [Menghasilkan kebalikan dari nilai operand (unary operator).], [`!true`], [`false`],
)

_Tabel 2: Ringkasan Operator Logika dalam C++_

==== Operator Logika AND (&&)

Operator logika AND (`&&`) adalah operator biner yang mengharuskan kedua operandnya bernilai `true` agar hasil akhirnya `true`. Jika salah satu atau kedua operand bernilai `false`, maka hasilnya akan `false`. Operator ini berguna untuk memastikan bahwa beberapa kondisi terpenuhi secara bersamaan. Contohnya, sistem perbankan dapat memeriksa apakah pemohon memiliki penghasilan tetap _dan_ rekam jejak kredit yang baik. Pernyataan kondisionalnya akan menjadi `if (hasStableIncome && hasGoodCreditHistory)`, di mana blok kode hanya dieksekusi jika kedua variabel `true`. Operator `&&` bersifat "short-circuit", artinya jika operand pertama `false`, operand kedua tidak akan dievaluasi karena hasil akhir sudah pasti `false`.

==== Operator Logika OR (||)

Operator logika OR (`||`) adalah operator biner yang menghasilkan `true` jika salah satu atau kedua operandnya `true`, dan hanya akan `false` jika kedua operand bernilai `false`. Operator ini digunakan untuk mengeksekusi aksi jika setidaknya satu dari beberapa kondisi terpenuhi. Misalnya, sebuah program memberikan diskon jika pelanggan adalah anggota premium _atau_ jika total pembelian melebihi batas tertentu. Pernyataannya menjadi `if (isPremiumMember || totalPurchase > 1000000)`. Blok kode di dalam `if` akan dieksekusi jika salah satu atau kedua kondisi tersebut benar. Sama seperti `&&`, operator `||` juga memiliki sifat "short-circuit"; jika operand pertama `true`, maka operand kedua tidak dievaluasi karena hasilnya sudah pasti `true`.

==== Operator Logika NOT (!)

Operator logika NOT, yang disimbolkan dengan `!`, adalah operator unary (satu operand) yang membalikkan nilai boolean operandnya. Jika operand `true`, hasilnya `false`, dan sebaliknya. Operator ini berguna untuk memeriksa kebalikan dari suatu kondisi. Contohnya, `if (!isLoggedIn)` digunakan untuk memeriksa apakah seorang pengguna _belum_ login. Jika `isLoggedIn` bernilai `false`, maka `!isLoggedIn` akan menjadi `true`, sehingga blok kode di dalam `if` dieksekusi, misalnya untuk menampilkan halaman login. Operator `!` sering dipakai untuk menyederhanakan logika dan membuat kode lebih mudah dipahami, terutama saat menangani kasus negatif.

=== Tabel Kebenaran (Truth Table) Operator Logika

#table(
  columns: 5,
  [Operand 1 (A)], [Operand 2 (B)], [A && B], [A || B], [!A],
  [`true`], [`true`], [`true`], [`true`], [`false`],
  [`true`], [`false`], [`false`], [`true`], [`false`],
  [`false`], [`true`], [`false`], [`true`], [`true`],
  [`false`], [`false`], [`false`], [`false`], [`true`],
)

== Struktur Percabangan If, Else If, dan Else dalam C++

=== Definisi dan Fungsi Struktur Percabangan

Struktur percabangan adalah konsep dasar pemrograman yang memungkinkan program membuat keputusan dan mengeksekusi kode berbeda berdasarkan kondisi tertentu. Dalam C++, struktur ini diimplementasikan menggunakan `if`, `else if`, dan `else`. Fungsi utamanya adalah untuk mengontrol alur eksekusi program secara dinamis, sehingga tidak hanya menjalankan perintah secara berurutan. Dengan struktur percabangan, program dapat menanggapi berbagai input atau situasi dengan cara yang berbeda. Misalnya, sebuah program kalkulator dapat menggunakan `if-else if-else` untuk menentukan operasi aritmatika yang akan dilakukan berdasarkan operator pilihan pengguna.

Struktur percabangan bekerja dengan mengevaluasi suatu kondisi di dalam tanda kurung `if`. Kondisi ini biasanya merupakan ekspresi dengan operator perbandingan atau logika, yang hasilnya adalah nilai boolean (`true` atau `false`). Jika kondisi tersebut bernilai `true`, maka blok kode di bawah `if` akan dieksekusi. Jika bernilai `false`, program akan melanjutkan untuk mengevaluasi kondisi `else if` berikutnya (jika ada), atau langsung mengeksekusi blok kode pada `else`.

=== Sintaks dan Struktur If-Else If-Else

Struktur `if-else if-else` adalah bentuk lebih kompleks dari `if` sederhana, yang memungkinkan program memilih dari beberapa alternatif berbeda. Struktur ini sangat cocok digunakan ketika terdapat lebih dari dua kemungkinan hasil dari evaluasi kondisi. Sintaks umumnya adalah sebagai berikut:

```cpp
if (kondisi1) {
    // Dieksekusi jika kondisi1 bernilai true
} else if (kondisi2) {
    // Dieksekusi jika kondisi1 bernilai false
    // dan kondisi2 bernilai true
} else if (kondisi3) {
    // Dieksekusi jika kondisi1 dan kondisi2 bernilai false
    // dan kondisi3 bernilai true
} else {
    // Dieksekusi jika semua kondisi di atas bernilai false
}
```

=== Alur Kontrol (Control Flow) pada Struktur If-Else If-Else

```cpp
if (score >= 90) {
    grade = 'A';
} else if (score >= 80) {
    grade = 'B';
} else if (score >= 70) {
    grade = 'C';
} else if (score >= 60) {
    grade = 'D';
} else {
    grade = 'F';
}
```

Dalam contoh di atas, jika `score` adalah 85, program akan mengevaluasi `score >= 90` (hasilnya `false`), lalu melanjutkan ke `score >= 80` (hasilnya `true`). Karena kondisi ini terpenuhi, maka `grade` akan diatur menjadi 'B', dan program tidak akan lagi memeriksa kondisi `score >= 70` atau yang lainnya. Sifat evaluasi yang berhenti pada kondisi pertama yang benar ini memastikan bahwa hanya satu blok kode yang dieksekusi, yang sesuai dengan sifat dari grade yang saling eksklusif .

=== Perbedaan If-Else If-Else dengan Nested If

Meskipun kedua struktur ini digunakan untuk pengambilan keputusan, terdapat perbedaan fundamental antara `if-else if-else` dan `nested if` (percabangan `if` yang bersarang).

-   `if-else if-else`: Struktur ini digunakan untuk memeriksa beberapa kondisi yang berada pada level yang sama (sekuensial). Kondisi-kondisi ini biasanya saling eksklusif, artinya hanya satu kondisi yang diharapkan terpenuhi. Alur program adalah linier, mengevaluasi kondisi satu per satu dari atas ke bawah. Sintaksnya lebih datar dan mudah dibaca ketika ada banyak kondisi yang perlu diperiksa. Contoh: menentukan kategori usia (anak-anak, remaja, dewasa, lansia) berdasarkan rentang umur .

-   `nested if`: Struktur ini digunakan ketika satu kondisi perlu diperiksa di dalam kondisi lain. Ini menciptakan struktur hierarkis atau bertingkat. Blok `if` yang bersarang hanya akan dieksekusi jika kondisi `if` induknya terpenuhi. Ini cocok untuk skenario di mana kondisi bersifat dependen atau memiliki hubungan "jika... maka...". Contoh: untuk menentukan apakah seseorang boleh mengemudi, kita perlu memeriksa apakah usianya cukup (`if (age >= 18)`), dan jika ya, baru kita periksa apakah ia memiliki SIM (`if (hasLicense)`). Struktur `nested if` akan terlihat seperti `if (age >= 18) { if (hasLicense) { ... } }`.

#pagebreak()

= BAB II – LAPORAN PRAKTIKUM

#image("../../laporan_image1_code1.png")

=== Penjelasan Kode

==== Bagian Input dan Validasi

```cpp
int nominal;
// ...
cout << "Masukkan nominal pembelian: Rp ";
cin >> nominal;

// Validasi nominal minimal
if (nominal < 20000) {
    cout << "\nNominal terlalu kecil! Minimal Rp 20.000" << endl;
    return 0; // Keluar dari program
}
```
Bagian ini bertanggung jawab untuk menerima input dari pengguna dan melakukan validasi. Variabel `nominal` dideklarasikan untuk menyimpan input. Pernyataan `cin >> nominal;` digunakan untuk membaca nilai yang dimasukkan oleh pengguna. Setelah itu, struktur `if` digunakan untuk memeriksa apakah nilai `nominal` kurang dari 20.000. Jika kondisi ini terpenuhi, program akan menampilkan pesan error dan menghentikan eksekusi dengan perintah `return 0;`.

==== Bagian Perhitungan Bonus dengan If-Else If-Else

```cpp
// Menentukan bonus berdasarkan nominal
if (nominal >= 100000) {
    bonus = 5000;
} else if (nominal >= 50000) {
    bonus = 2000;
} else { // Ini menangani kasus 20.000 <= nominal < 50.000
    bonus = 0;
}
```
Bagian ini adalah inti dari logika program. Struktur `if-else if-else` digunakan untuk menentukan besarnya bonus berdasarkan tier nominal pembelian. Program akan mengevaluasi kondisi dari atas ke bawah. Jika `nominal` lebih dari atau sama dengan 100.000, `bonus` akan diatur menjadi 5.000. Jika tidak, program akan memeriksa kondisi `else if` berikutnya. Jika `nominal` lebih dari atau sama dengan 50.000, `bonus` akan diatur menjadi 2.000. Jika kedua kondisi tersebut tidak terpenuhi, blok `else` akan dieksekusi, yang berarti `bonus` akan diatur menjadi 0.

==== Bagian Perhitungan Total Token

```cpp
int totalToken = nominal - ADMIN_FEE + bonus;
```
Setelah bonus ditentukan, total token dihitung menggunakan rumus yang telah ditetapkan. Nilai `nominal` dikurangi dengan `ADMIN_FEE` (biaya admin), kemudian ditambah dengan `bonus`. Hasilnya disimpan dalam variabel `totalToken`.

==== Bagian Output Rincian Pembelian

```cpp
cout << "\n--- RINCIAN PEMBELIAN ---" << endl;
cout << "Nominal: Rp " << nominal << endl;
cout << "Biaya Admin: Rp " << ADMIN_FEE << endl;
cout << "Bonus: Rp " << bonus << endl;
cout << "Token yang didapat: Rp " << totalToken << endl;
```
Bagian ini bertanggung jawab untuk menampilkan hasil akhir kepada pengguna. Semua rincian pembelian, termasuk nominal awal, biaya admin, bonus yang didapat, dan total token yang diterima, dicetak ke layar dengan format yang rapi dan mudah dibaca.

== Pengujian dan Hasil Program

=== Skenario Pengujian 1: Pembelian dengan Bonus Tertinggi

*Input:* `100000`
*Output yang Diharapkan:* Bonus Rp 5.000, Total Token Rp 102.500
*Hasil Program:*
```
=== PEMBELIAN TOKEN LISTRIK PLN ===
Masukkan nominal pembelian: Rp 100000

--- RINCIAN PEMBELIAN ---
Nominal: Rp 100000
Biaya Admin: Rp 2500
Bonus: Rp 5000
Token yang didapat: Rp 102500
```
*Analisis:* Program berhasil menentukan bonus tertinggi karena nominal pembelian memenuhi kondisi `nominal >= 100000`. Perhitungan total token juga sesuai: `100.000 - 2.500 + 5.000 = 102.500`.

=== Skenario Pengujian 2: Pembelian dengan Bonus Sedang

*Input:* `75000`
*Output yang Diharapkan:* Bonus Rp 2.000, Total Token Rp 74.500
*Hasil Program:*
```
=== PEMBELIAN TOKEN LISTRIK PLN ===
Masukkan nominal pembelian: Rp 75000

--- RINCIAN PEMBELIAN ---
Nominal: Rp 75000
Biaya Admin: Rp 2500
Bonus: Rp 2000
Token yang didapat: Rp 74500
```
*Analisis:* Program berhasil menentukan bonus sedang. Kondisi `nominal >= 100000` bernilai `false`, namun kondisi `nominal >= 50000` bernilai `true`. Perhitungan total token sesuai: `75.000 - 2.500 + 2.000 = 74.500`.

=== Skenario Pengujian 3: Pembelian Tanpa Bonus

*Input:* `30000`
*Output yang Diharapkan:* Bonus Rp 0, Total Token Rp 27.500
*Hasil Program:*
```
=== PEMBELIAN TOKEN LISTRIK PLN ===
Masukkan nominal pembelian: Rp 30000

--- RINCIAN PEMBELIAN ---
Nominal: Rp 30000
Biaya Admin: Rp 2500
Bonus: Rp 0
Token yang didapat: Rp 27500
```
*Analisis:* Program berhasil menentukan bahwa tidak ada bonus yang diberikan. Kondisi `nominal >= 100000` dan `nominal >= 50000` keduanya bernilai `false`, sehingga blok `else` dieksekusi. Perhitungan total token sesuai: `30.000 - 2.500 + 0 = 27.500`.

=== Skenario Pengujian 4: Pembelian Dibawah Nominal Minimal

*Input:* `15000`
*Output yang Diharapkan:* Pesan error "Nominal terlalu kecil! Minimal Rp 20.000"
*Hasil Program:*
```
=== PEMBELIAN TOKEN LISTRIK PLN ===
Masukkan nominal pembelian: Rp 15000

Nominal terlalu kecil! Minimal Rp 20.000
```
*Analisis:* Program berhasil melakukan validasi dan menolak transaksi. Kondisi `nominal < 20000` bernilai `true`, sehingga pesan error ditampilkan dan program dihentikan.
