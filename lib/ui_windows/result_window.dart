import 'package:bmirechner/constants.dart';
import 'package:bmirechner/ui_components/RoundButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultWindows extends StatelessWidget {
  const ResultWindows({Key? key, required this.bmiColor,
                                 required this.bmiResult,
                                 required this.bmiText}) : super(key: key);

  // Damit die Daten auch übergeben werden können, müssen hier erst
  // die Parameter angelegt werden.
  final String bmiResult;
  final Color bmiColor;
  final String bmiText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ergebnis',
          style: kAppBarTextStyle,),
        // Hiermit wird das zurüc verhindert. Dies soll nachher über
        // den Button geschehen. Somit fehlt der BACK Button im Menü
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // Alle elemente zentriert darstellen
          crossAxisAlignment: CrossAxisAlignment.center,
          // Alle elemente auf dem Bildschirm gleichmäßig verteilen
          children: [
            Stack(
              // Alligment, damit alle inhalte centriert dargestellt werden.
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                decoration: BoxDecoration(
                  color: bmiColor,
                      shape: BoxShape.circle,
                ),),
                Container(
                  width: 220,
                  height: 220,
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    shape: BoxShape.circle,
                  ),),
                Center(
                  child: Text(bmiResult,
                    style: TextStyle(
                      fontSize: 90,
                    ),),
                )
              ],
            ),
            Text(bmiText,
            style: TextStyle(fontSize: 40),),
            RoundButtonWidget(color: kLightGrayWidgetBackgroundColor,
                content: Icon(FontAwesomeIcons.reply,
                  size: 70,color: Color(0xFF0047FF),),
                isTapped: (){Navigator.pop(context);}),
          ],
        ),
      ),
    );
  }

}
