
import 'package:bmirechner/bmi_calculator.dart';
import 'package:bmirechner/ui_components/RoundButtonWidget.dart';
import 'package:bmirechner/ui_windows/result_window.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

// die ICONS werden von https://fontawesome.com geladen
// dazu laden wir da package font_awesome_flutter von pub.dev

// Ein APP Icon kann man unter appicon.co erstellen
// Video dazu: https://www.youtube.com/watch?v=0iCaJgt3fkU

// Malprogramm online: https://www.autodraw.com

// suchen nach html Editor flutter wyswag
// text editor to help write WYSIWYG

// Example für Runde Button: https://www.youtube.com/watch?v=8soLfecfEFk


class InputWindow extends StatefulWidget {
  const InputWindow({Key? key}) : super(key: key);

  @override
  State<InputWindow> createState() => _InputWindowState();
}

class _InputWindowState extends State<InputWindow> {

  int age = 25;
  int height = 180;
  int weight = 65;
  String gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI-Rechner',
                    style: kAppBarTextStyle,),
      ),
      // WICHTIG: Hier sind einige Elemente enthalten. Aus diesem Grund
      // fügen wir jetzt noch eine SAFE-AREA ein, damit das ganze nicht
      // über den Bildschirmrand hinausläuft.
      // MIT ALT+ENTER wandeln wir jetzt die Column um in ein Widget
      // und ändern den Namen WIDGET in SafeArea
      body: SafeArea(
        child: Column(
          children: [
            // Icon Mann und Frau
            //  ICON Bottons
            Expanded(
              child: Row(
                // Die button in der Mitte
                // ausrichten.
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundButtonWidget(
                  color:  gender == kMale ? kdarkGrayWidgetBackgroundColor :
                    kLightGrayWidgetBackgroundColor,
                  content: const Icon(FontAwesomeIcons.person,
                                size: kRoundButtonWidgetRadius,
                                color: Color(0xFFC2EBFF),),
                  isTapped: () {
                    setState(() {
                      gender = kMale;
                    });
                  },
                ),
                  RoundButtonWidget(
                    color: gender == kFemale ? kdarkGrayWidgetBackgroundColor :
                    kLightGrayWidgetBackgroundColor,
                    content: const Icon(FontAwesomeIcons.personDress,
                                  size: kRoundButtonWidgetRadius,
                                  color: Color(0xFFFFC0D1),),
                    isTapped: () {
                      setState(() {
                        gender = kFemale;
                      });
                    },
                  ),


                ],
              ),
            ),
            // Alter Eingabe Moduel
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Alter", style:  kUnitTextStyle,),
                          ),
                          SizedBox(width:100,),
                          Text(
                            age.toString(),
                            style: kValueTextStyle,),
                          SizedBox(width: 5,),
                          Text(""),
                        ],
                      ),
                      Slider(
                        value: age.toDouble(),
                        min: 0,
                        max: 140,
                        onChanged: (double newValue) {
                          // Setzte den neuen STATE auf das VALUE
                          setState(() {
                            age = newValue.round();
                          });
                        },
                      ),
                    ],  // children
                  ),
                  decoration: BoxDecoration(
                    color: kLightGrayWidgetBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Größe Moduel
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Größe", style:  kUnitTextStyle,),
                          ),
                          SizedBox(width:80,),
                          Text(
                            height.toString(),
                            style: kValueTextStyle,),
                          SizedBox(width: 5,),
                          Text("cm"),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 0,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ],  // children
                  ),
                  decoration: BoxDecoration(
                    color: kLightGrayWidgetBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Textboxen als Containter das 3 x
            // Gewicht Eingabe Moduel
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Gewicht", style:  kUnitTextStyle,),
                          ),
                          SizedBox(width:70,),
                          Text(weight.toString()
                            ,style: kValueTextStyle,),
                          SizedBox(width: 5,),
                          Text("kg"),
                        ],
                      ),
                      Slider(
                        value: weight.toDouble(),
                        min: 0,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.round();
                          });
                        },
                      ),
                    ],  // children
                  ),
                  decoration: BoxDecoration(
                    color: kLightGrayWidgetBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Play Button
            RoundButtonWidget(
              color: Color(0xFF3E3E4C),
              content: Icon(FontAwesomeIcons.play,
                size: kRoundButtonWidgetRadius,
                color: Color(0xFF558945),
              ),
              isTapped: _ButtonViewResult, //_ButtonViewResult(),
              // FEHLER ist bei 2:51
            ),
          ], // Children
        ),
      ),
    );
  }
  void _ButtonViewResult()
  {
    // Berechnen der Werte
    // wir erzeugen eine Classe vom Type BMICalcularor
    BMICalculator result = BMICalculator(
        gender: gender,
        age: age,
        height: height,
        weight: weight);
    // result greif auf die erzeugte klasse zu :-)
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            ResultWindows(
                bmiResult: result.BMICalculation(),
                bmiColor: result.getBMIColor(),
                bmiText: result.getBMIText())));
  }
}

