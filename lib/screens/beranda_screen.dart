import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'suscatin_screen.dart';
import '../providers/navigation_provider.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_screen.dart';

class BerandaScreen extends StatefulWidget {
  BerandaScreen({super.key});

  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final Color greenColor = Color(0xFF31502C);
  final Color greyColor = Color(0xFF636573);
  final Color blackColor = Color(0xFF3B3E51);
  final Color yellowColor = Color(0xFFF3CD00);

  final List<Map<String, dynamic>> steps = [
    {
      'title': 'Siapkan Berkas Persyaratan',
      'description': [
        "Foto Copy KTP",
        "Foto Copy KTP Orang Tua",
        "Foto Copy KTP Wali Nikah",
        "Foto Copy KTP Saksi Nikah",
        "Foto Copy Ijazah",
        "Foto Copy KK",
        "Foto Copy Akta Kelahiran",
        "Pas Photo 2x3 (4 lembar) & 4x6 (1 lembar)",
        "Akta Cerai (Bagi Duda/Janda cerai)",
        "N6 (Bagi Duda/Janda Mati)",
        "Surat Izin Kawin dari Komandan (Bagi Anggota TNI/POLRI)",
      ],
      'icon': 'assets/images/step1.png',
    },
    {
      'title': 'Datang Ke Kelurahan/Desa',
      'description': [
        "Meminta Formulir N1,N2,N3,N4,N5,N6 & SKW",
        "Mengisi Formulir dan ditandatangani oleh Lurah/Kepala Desa",
      ],
      'icon': 'assets/images/step2.png',
    },
    {
      'title': 'Membawa Persyaratan ke KUA',
      'description': [
        "Membawa Semua Persyaratan dari Kelurahan/Desa",
        "Meminta  Billing Pembayaran untuk ke Kantor POS",
      ],
      'icon': 'assets/images/step3.png',
    },
    {
      'title': 'Membayar Billing Pembayaran',
      'description': [
        "Menyerahkan Billing Pembayaran dari KUA",
        "Menyetorkan biaya Nikah",
        "Meminta Slip Setoran",
      ],
      'icon': 'assets/images/step4.png',
    },
    {
      'title': 'Menyerahkan Slip Pembayaran',
      'description': [
        "Menyerahkan Slip Setoran dari Kantor POS (Asli & 4 Rangkap Foto Copy)",
        "Menerima Surat untuk Penataran Calon Pengantin",
      ],
      'icon': 'assets/images/step5.png',
    },
    {
      'title': 'Melaksanakan Penataran (Suscatin)',
      'description': [
        "Menerima Materi Bimbingan Kursus Calon Pengantin (Suscatin) dan Praktek Ijab Qobul.",
      ],
      'icon': 'assets/images/step6.png',
    },
    {
      'title': 'Prosesi Akad Nikah',
      'description': [
        "Menunggu dan Menghubungi Petugas KUA (Penghulu) pada saat pelaksanaan Akad Nikah.",
      ],
      'icon': 'assets/images/step7.png',
    },
    {
      'title': 'Penyerahan Buku Nikah',
      'description': [
        "Penyerahan Buku Nikah kepada pengantin sebagai tanda bukti bahwa perkawinan yang telah dilaksanakan sah secara hukum negara.",
      ],
      'icon': 'assets/images/step8.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Row(
          children: [
            Image.asset('assets/images/logo-appbar.png', height: 30),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KUA PUSAKA KARAWANG BARAT",
                  style: GoogleFonts.poppins(
                    color: yellowColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Sistem Manajemen Data Religi & Agama",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              // Background Banner
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/beranda_banner.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Overlay dengan informasi
              Container(
                width: double.infinity,
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kantor Urusan Agama\nKecamatan Karawang Barat",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: yellowColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Senin - Jum'at 07.00 s/d 16.00",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize
                                    .min, // Menghindari tombol terlalu lebar
                            children: [
                              Text(
                                "Kunjungi",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: greenColor,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ), // Memberi jarak antara teks dan ikon
                              Icon(
                                Icons.open_in_new,
                                size: 18,
                                color: greenColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              // Tambahkan aksi navigasi di sini
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: greenColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sample Dokumen Pernikahan",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: greenColor,
                            radius: 18,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: yellowColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            step['title'],
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 65,
                            backgroundImage: AssetImage(step['icon']),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                step['description'].length,
                                (i) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${i + 1}. ${step['description'][i]}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: greenColor,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
