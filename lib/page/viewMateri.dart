import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heager/page/materiweb.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/src/flutter/container.dart';

class MateriHeager extends StatelessWidget {
  const MateriHeager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const viewMateri(),
    );
  }
}

class viewMateri extends StatelessWidget {
  const viewMateri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        Container(
          height: 190,
          width: Get.width,
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10))),
          child: HStack(
            [
              VStack([
                Text(
                  "Selamat Datang",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ).py16(),
                Text(
                  "di Materi",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Text(
                  "Healthy Teenager",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ]).expand(),
              Image.asset("assets/img/ilus2.png")
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => CardList(index: index))
            .box
            .make()
            .expand()
      ]),
    );
  }
}

class CardList extends StatelessWidget {
  final int index;
  final List<String> judul = [
    "Apa Itu Menarche?",
    "Faktor-Faktor Yang Menyebabkan Menarche",
    "Faktor Yang Mempengaruhi Menarche",
    "Fase Dalam Menstruasi",
    "Tanda Dan Gejala Menstruasi",
    "Penggunaan Pembalut",
    "Hal Yang Harus Dilakukan Untuk Menjaga Kebersihan Genetalia Saat Menstruasi",
    "Hal Yang Perlu Diperhatikan Saat Menstruasi",
  ];

  final List<String> link = [
    "https://appinter.id/2022/01/17/apa-itu-menarche/",
    "https://appinter.id/2022/01/17/faktor-faktor-yang-menyebabkan-menarche/",
    "https://appinter.id/2022/01/18/faktor-yang-mempengaruhi-menarche/",
    "https://appinter.id/2022/01/22/fase-dalam-menstruasi/",
    "https://appinter.id/2022/01/22/tanda-dan-gejala-menstruasi/",
    "https://appinter.id/2022/01/22/penggunaan-pembalut/",
    "https://appinter.id/2022/01/22/hal-yang-harus-dilakukan-untuk-menjaga-kebersihan-genetalia-saat-menstruasi/",
    "https://appinter.id/2022/01/22/hal-yang-perlu-diperhatikan-saat-menstruasi/",
  ];

  CardList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(() => MateriApp(
              title: judul[index],
              link: link[index],
            )),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0.5, 0.5))
          ]),
          child: HStack(
            [
              Image.asset(
                ("assets/img/" + (index + 1).toString()) + " Materi.jpg",
                height: 80,
                fit: BoxFit.cover,
                width: 70,
              ),
              VStack([
                ("Materi " + (index + 1).toString())
                    .text
                    .color(const Color(0xff0055A5))
                    .bold
                    .make(),
                judul[index].text.make()
              ]).px16().expand(),
            ],
          )
              .card
              .customRounded(BorderRadius.circular(5))
              .color(Colors.white)
              .make(),
        ).px24().py4());
  }
}
