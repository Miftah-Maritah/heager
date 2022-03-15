import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heager/page/kalender.dart';
import 'package:heager/page/qna.dart';
import 'package:heager/page/quiz.dart';
import 'package:heager/page/tentang.dart';
import 'package:heager/page/video.dart';
import 'package:heager/page/viewMateri.dart';

import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Aplikasi Heager",
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: Colors.blue[900]),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VStack(
      [
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
                  "di HEAGER",
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
              Image.asset("assets/img/ilus1.png")
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 10 / 11),
          itemBuilder: (context, index) => GridApp(
            index: index,
          ),
        ).box.make().expand()
      ],
    ));
  }
}

class GridApp extends StatelessWidget {
  final int index;
  final List<String> judul = [
    "Tentang Heager",
    "Materi",
    "Kalender",
    "Quiz",
    "QnA",
    "Video",
  ];

  final List<Widget> pindah = [
    const Tentang(),
    viewMateri(),
    Kalender(),
    Quiz(),
    Qna(),
    Video(),
  ];

  GridApp({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => pindah[index]),
      child: VxBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ("assets/img/" + (index + 1).toString()) + ".png",
              height: 70,
              fit: BoxFit.fill,
              width: 65,
            ).py12(),
            judul[index]
                .text
                .color(Colors.blue)
                .base
                .ellipsis
                .maxLines(2)
                .makeCentered()
          ],
        ).backgroundColor(Colors.white).cornerRadius(10),
      )
          .outerShadowXl
          .customRounded(BorderRadius.circular(10))
          .make()
          .px12()
          .py12(),
    );
  }
}
