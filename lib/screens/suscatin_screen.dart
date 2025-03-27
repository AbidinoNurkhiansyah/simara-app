import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuscatinScreen extends StatelessWidget {
  SuscatinScreen({super.key});
  final Color greenColor = Color(0xFF31502C);
  final Color greyColor = Color(0xFF636573);
  final Color blackColor = Color(0xFF3B3E51);
  final Color yellowColor = Color(0xFFF3CD00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo-appbar.png',
                  height: 30,
                ), // Ganti dengan logo sesuai kebutuhan
                const SizedBox(width: 8),
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
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Halo, Abidino",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildJadwalCard(),
            const SizedBox(height: 16),
            _buildScheduleSection("Senin", [
              _buildScheduleItem("H. Hamid Dulmajid, SH", [
                {
                  "time": "09.00 - 11.00 WIB",
                  "status": "5 Pasangan",
                  "statusColor": yellowColor,
                },
                {
                  "time": "13.00 - 16.00 WIB",
                  "status": "Penuh",
                  "statusColor": greenColor,
                },
              ]),
            ]),
            _buildScheduleSection("Kamis", [
              _buildScheduleItem("H. Eman Sulaeman, S.Ag", [
                {
                  "time": "09.00 - 11.00 WIB",
                  "status": "Penuh",
                  "statusColor": greenColor,
                },
                {
                  "time": "13.00 - 16.00 WIB",
                  "status": "5 Pasangan",
                  "statusColor": yellowColor,
                },
              ]),
            ]),
            const SizedBox(height: 16),
            Text(
              "Jika ada perubahan jadwal harap konfirmasi kepada pihak KUA dan melakukan penjadwalan ulang.",
              style: GoogleFonts.poppins(fontSize: 14, color: greyColor),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: greenColor,
        child: const Icon(Icons.calendar_month, color: Colors.white),
      ),
    );
  }

  Widget _buildJadwalCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jadwal Suscatin",
                style: GoogleFonts.poppins(
                  color: yellowColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "18 Februari 2025",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "KUA Pusaka Karawang Barat",
                style: GoogleFonts.poppins(
                  color: yellowColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/image-banner.png',
            height: 70,
          ), // Ganti ikon dengan gambar dari web
        ],
      ),
    );
  }

  Widget _buildScheduleSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(children: items),
      ],
    );
  }

  Widget _buildScheduleItem(String name, List<Map<String, dynamic>> sessions) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: yellowColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            children:
                sessions.map((session) {
                  int index = sessions.indexOf(session);
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            session["time"],
                            style: TextStyle(fontSize: 14, color: greyColor),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  session["statusColor"]
                                      as Color, // Pastikan warna diambil dari data
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              session["status"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (index <
                          sessions.length -
                              1) // Jika bukan elemen terakhir, tambahkan garis pemisah
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(
                            color:
                                yellowColor, // Warna garis sama dengan border
                            thickness: 1,
                          ),
                        ),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
