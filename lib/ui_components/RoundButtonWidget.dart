import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({Key? key,
      required this.color,
      required this.content,
      required this.isTapped}) : super(key: key);

  final Color color;
  final Widget content;
  final VoidCallback isTapped;   // = function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTapped, // () {isTapped();},
      child: Container(
        child: content,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(70),

        ),
      ) ,
    );
  }
}
// ALTERNATIV könnte man auch hier mit einem: IconButton arbeiten
// https://api.flutter.dev/flutter/material/IconButton-class.html?gclid=Cj0KCQjw98ujBhCgARIsAD7QeAjc-IHZD8g1t_GEocdb6ipbKUq7FuXWRNhC9VPhxW3XtJDcKxx-mkUaAiuuEALw_wcB&gclsrc=aw.ds