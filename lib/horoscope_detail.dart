import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:horoscope_guide/model/horoscope.dart';

class HoroscopeDetail extends StatefulWidget {
  final Horoscope horoscope;
  const HoroscopeDetail({super.key, required this.horoscope});

  @override
  State<HoroscopeDetail> createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Color appbarTitle = Colors.white;
  Color appBarBacground = Colors.orange;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    findAppbarColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarBacground,
              foregroundColor: appbarTitle,
              expandedHeight: 200,
              pinned: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.horoscope.name + " burcu ve Özellikleri",
                  style: const TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                background: Image.asset(
                  "assets/images/${widget.horoscope.bigIcon}",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey.shade200,
                child: Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.horoscope.detail,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void findAppbarColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/${widget.horoscope.bigIcon}"));
    appBarBacground = _generator.dominantColor!.color;
    setState(() {});
  }
}
