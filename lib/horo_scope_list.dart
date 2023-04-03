import 'package:flutter/material.dart';
import 'package:horoscope_guide/data/strings.dart';
import 'package:horoscope_guide/horoscope_item.dart';
import 'package:horoscope_guide/model/horoscope.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> horoscopes;
  HoroscopeList({super.key}) {
    horoscopes = prepareData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burç listesi"),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 30),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return HoroscopeItem(
              horoscope: horoscopes[index],
            );
          },
          itemCount: horoscopes.length,
        ),
      ),
    );
  }

  List<Horoscope> prepareData() {
    List<Horoscope> a = [];
    for (int i = 0; i < 12; i++) {
      a.add(Horoscope(
        Strings.BURC_ADLARI[i],
        Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i],
        "${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png",
        "${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png",
      ));
    }
    return a;
  }
}
