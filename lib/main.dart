import 'package:bmirechner/ui_windows/input_window.dart';
import 'package:bmirechner/ui_windows/result_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

// VIDEO: https://www.youtube.com/watch?v=QO0hGaoc7mM
// Zeit: 3:41

// SChriftart festlegen: Suchen Schriftart: sansation font download
// Nachdem Download der Schriftart abgeschlossen ist. Erstellen wir
// wir im Verzeichnis unserer APP einen neuen Ordner mit dem Namen
// FONTS (frei wählbar). Dann kopieren wir die Schriftarten, die
// wir für das Projekt brauchen.
// Noch kennt das Projekt die Schriftart nicht. Darum gehen wir dann
// in die PUBSPEC.YAML. Gehen hier ganz nach unter. Dort steht #fonts

void main() {
  // Änderung:
  // Hier wird festgelegt, das die APP nur Horizontal sein darf.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).
        then((value) => runApp(BMICalc()));
  // runApp(const BMICalc());
}

class BMICalc extends StatelessWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wir stellen die Farbe auf DARK Modus. Da die Farbe aber nicht
      // 100 % passt modifizieren wir diese noch einmal
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        // scaffoldBackgroundColor die Farbe vom Body
        scaffoldBackgroundColor: kBackgroundColor,
        // Hier tragen wir den Font dann global für das ganze Projekt ein.
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Sansation',
          bodyColor: Colors.white,
        ),
      ),
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      home: const InputWindow(), // ResultWindows() // ,
    );
  }
}
