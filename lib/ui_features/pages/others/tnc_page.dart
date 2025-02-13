import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/image/asset_image.dart';

class TncPage extends StatelessWidget {
  const TncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Syarat dan Ketentuan"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Divider(
            color: ColorAsset.neutral80,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 16),
          MPAssetImage(Assets.dragonStand, width: 125, height: 152),
          const SizedBox(height: 20),
          Text(
            'Syarat dan Ketentuan',
            style: StyleAsset.heading2Bold,
          ),
          const SizedBox(height: 20),
          ...[
            (
              title: 'ACCEPTANCE OF TERMS',
              desc:
                  "By using this application, you agree to abide by these terms and conditions and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained on this application are protected by applicable copyright and trademark law.",
            ),
            (
              title: 'USE LICENSE',
              desc: '''
Permission is granted to temporarily download one copy of the materials (information or software) on PT. Etica Sari Pratama's application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:

• modify or copy the materials;
• use the materials for any commercial purpose or for any public display (commercial or non-commercial);
• attempt to decompile or reverse engineer any software contained on PT. Etica Sari Pratama's application;
• remove any copyright or other proprietary notations from the materials; or
• transfer the materials to another person or "mirror" the materials on any other server.

This license shall automatically terminate if you violate any of these restrictions and may be terminated by PT. Etica Sari Pratama at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession, whether in electronic or printed format.'''
            ),
            (
              title: 'DISCLAIMER',
              desc: '''
The materials on PT. Etica Sari Pratama's application are provided on an 'as is' basis. PT. Etica Sari Pratama makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.

Further, PT. Etica Sari Pratama does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its application or otherwise relating to such materials or on any sites linked to this site.'''
            ),
            (
              title: 'LIMITATIONS',
              desc:
                  '''The materials on PT. Etica Sari Pratama's application are provided on an 'as is' basis. PT. Etica Sari Pratama makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.

Further, PT. Etica Sari Pratama does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its application or otherwise relating to such materials or on any sites linked to this site.'''
            ),
            (
              title: 'REVISIONS AND ERRATA',
              desc:
                  "The materials appearing on PT. Etica Sari Pratama's application could include technical, typographical, or photographic errors. PT. Etica Sari Pratama does not warrant that any of the materials on its application are accurate, complete, or current. PT. Etica Sari Pratama may make changes to the materials contained on its application at any time without notice. PT. Etica Sari Pratama does not, however, make any commitment to update the materials."
            ),
          ].asMap().entries.map((e) {
            bool showDetail = true;
            return StatefulBuilder(builder: (context, setState) {
              return Column(children: [
                GestureDetector(
                  onTap: () => setState(() => showDetail = !showDetail),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorAsset.subtitle,
                      ),
                      borderRadius: !showDetail
                          ? BorderRadius.circular(4)
                          : const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                    ),
                    child: Row(children: [
                      Text(
                        '${e.key + 1}. ${e.value.title}',
                        style: StyleAsset.paragraph2SemiBold,
                      ),
                      const Spacer(),
                      Transform.rotate(
                        angle: showDetail ? 3.125 : 0,
                        child: const MPAssetImage(
                            "$assetIcon/ic_keyboard_arrow_down.svg"),
                      ),
                    ]),
                  ),
                ),
                if (showDetail)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorAsset.subtitle.withValues(alpha: 0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      e.value.desc,
                      style: StyleAsset.paragraph2,
                    ),
                  ),
                const SizedBox(height: 16),
              ]);
            });
          }),
          const SizedBox(height: 16),
//           MPAssetImage(Assets.dragonStand, width: 125, height: 152),
//           const SizedBox(height: 20),
//           Text(
//             'FAQ',
//             style: StyleAsset.heading2Bold,
//           ),
//           const SizedBox(height: 20),
//           ...[
//             (
//               title: 'TATA CARA CATAT TRANSAKSI',
//               desc: '''
// Cara untuk mencatat transaksi adalah:

// • Pastikan anda telah masuk dan login dengan email yang valid;
// • Kemudian anda bisa masuk ke menu transaksi;
// • Klik tombol "Tambah";
// • Didalam nya anda diminta untuk memasukan (ID Distributor, No Faktur, Tanggal jatuh tempo pembayaran etc), pastikan anda memasukan data data tersebut sesuai dengan data yang telah diberikan;
// • Nantinya sistem akan memvalidasi data yang anda masukan, setelah anda membayar transaksi tersebut.'''
//             ),
//             (
//               title: 'TATA CARA KONFIRMASI PEMBAYARAN',
//               desc: '''
// Setelah anda membayar anda dapat memberitahu admin bahwa sudah membayar transasi tersebut dengan cara mengkonfirmasi pembayaran:

// • Pastikan anda telah memcatat transaksi dalam sistem dengan benar;
// • Maka didalam list transaksi akan muncul item yang telah anda buat;
// • Anda dapat menekan "Konfirmasi pembayaran" untuk memberitahu admin catatan anda dalam prioritas;
// • Maka akan muncul dialog, anda bisa klik konfirmasi untuk menyelesaikan; '''
//             ),
//             (
//               title: 'TATA CARA CLAIM REWARD',
//               desc: '''
// Setelah transaksi telah di validasi oleh admin, anda dapat melihat progress level pembelian anda untuk claim reward yang bisa claim dengan cara :

// • Masuk ke menu "Beranda", dan lihat progress bar; atau
// • Masuk kedalam menu "Magic Ball", anda dapat melihat progress pembelian anda;
// • Jika akun anda telah tervalidasi mendapat reward maka akan muncul dialog claim, anda dapat menekan tombol tersebut untuk meminta proses claim;
// • Kalkulasi reward akan kami hitung sesuai dengan Syarat & Ketentuan;
// • Pastikan nomor yang anda daftarkan adalah nomor yang terhubung dengan akun E-Wallet; Jika
// • Nomor anda berbeda dengan akun E-Wallet anda dapat mengubahnya di Edit Profile;
// '''
//             ),
//             (
//               title: 'TATA CARA EDIT PROFIL',
//               desc:
//                   '''Anda dapat mengubah data pribadi anda jika ada yang tidak seusuai atau salah ketika pertama kali mendaftar,dengan cara :

// • Anda bisa masuk kedalam menu "Profil";
// • Anda bisa menekan tombol pensil pojok kanan atas untuk diarahkan kedalam form edit data;
// • Anda dapat mengubah data data anda didalam tersebut;
// • Untuk menyselesaikan anda bisa klik simpan;'''
//             ),
//             (
//               title: 'TATA CARA GANTI PASSWORD',
//               desc:
//                   '''Untuk mengganti password ada beberapa cara jika anda ingat dengan password lama anda anda bisa ikuti langkah berikut :

// • Pastikan anda sudah masuk ke akun anda;
// • Masuk kedalam menu "Profil" didalam sana ada menu "Keamanan";
// • Masuk kedalam menu "Keamanan";
// • Anda diminta memasukan password lama dan password baru;
// • Jika sudah selesai anda bisa tekan "Simpan";

// Bila anda lupa dengan password lama maka anda bisa melakukan forgot password dihalaman depan login, dengan cara klik forgot password maka kami akan kirimkan link verifikasi melalui email yang terdaftar untuk perubahan password anda
//                   '''
//             ),
//             (
//               title: 'ATURAN PERMAINAN',
//               desc:
//                   '''Minimum PO (Transaksi) 420 pcs atau 1 Karton. Berlaku kelipatan.
// Cth : Beli 500 pcs, terhitung hanya 1 karton. Karena, 80 pcs lebihnya tidak dapat diakumulasi ke PO berikutnya
//                   '''
//             ),
//           ].asMap().entries.map((e) {
//             bool showDetail = true;
//             return StatefulBuilder(builder: (context, setState) {
//               return Column(children: [
//                 GestureDetector(
//                   onTap: () => setState(() => showDetail = !showDetail),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: ColorAsset.subtitle,
//                       ),
//                       borderRadius: !showDetail
//                           ? BorderRadius.circular(4)
//                           : const BorderRadius.only(
//                               topLeft: Radius.circular(4),
//                               topRight: Radius.circular(4),
//                             ),
//                     ),
//                     child: Row(children: [
//                       Text(
//                         '${e.key + 1}. ${e.value.title}',
//                         style: StyleAsset.paragraph2SemiBold,
//                       ),
//                       const Spacer(),
//                       Transform.rotate(
//                         angle: showDetail ? 3.125 : 0,
//                         child: const MPAssetImage(
//                             "$assetIcon/ic_keyboard_arrow_down.svg"),
//                       ),
//                     ]),
//                   ),
//                 ),
//                 if (showDetail)
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: ColorAsset.subtitle.withValues(alpha: 0.5),
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(4),
//                         bottomRight: Radius.circular(4),
//                       ),
//                     ),
//                     child: Text(
//                       e.value.desc,
//                       style: StyleAsset.paragraph2,
//                     ),
//                   ),
//                 const SizedBox(height: 16),
//               ]);
//             });
//           }),
        ]),
      ),
    );
  }
}
