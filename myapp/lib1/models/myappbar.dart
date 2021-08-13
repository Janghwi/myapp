import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyAppBar extends StatelessWidget {

  final double barHeight = 60.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(child: Padding(
            padding: const EdgeInsets.all(8.0),
             child: ColorizeAnimatedTextKit(
              text:["ENKORNESE",],
              textStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Montserrat"),
                colors: [
                  Colors.red,
                  Colors.blue,
                  Colors.white,
                  //Colors.red,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
            ),
          ),

          Container(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.userCircle, color: Colors.white,),
          ),
         ),

        ],
      ),
    );
    
  }
}