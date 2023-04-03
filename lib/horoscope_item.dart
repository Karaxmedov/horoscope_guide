import 'package:flutter/material.dart';
import 'package:horoscope_guide/horoscope_detail.dart';

import 'model/horoscope.dart';

class HoroscopeItem extends StatelessWidget {
  final Horoscope horoscope;
  const HoroscopeItem({required this.horoscope, super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HoroscopeDetail(horoscope: horoscope)));
          },
          leading: Image.asset(
            "assets/images/${horoscope.smallIcon}",
          ),
          title: Text(
            horoscope.name,
            style: myTextStyle.headlineSmall,
          ),
          subtitle: Text(
            horoscope.dates,
            style: myTextStyle.labelLarge,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange.shade300,
          ),
        ),
      ),
    );
  }
}
