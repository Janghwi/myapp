import 'package:enkornese/getphrases01.dart';
import 'package:flutter/material.dart';

import '../getphrases04.dart';
import 'iconcategory.dart';

void main() => runApp(IconItem());

class IconItem extends StatelessWidget {
  final IconCategory icondata;
  

  IconItem({Key key, this.icondata}) : super(key: key);

  @override
  Widget build(BuildContext context) => new GestureDetector(
    onTap: () {
      print(icondata.routeName);
      switch (icondata.routeName) {
      case 'a01' :  {
        Navigator.push(
           context, new MaterialPageRoute(builder: (context) => GetPhrases01(screenTitle:'abc' , firestoreName:'temphangul')));
           }
           break; 
      case 'a02' :  {
        Navigator.push(
           context, new MaterialPageRoute(builder: (context) => LoadDataFromFirestore()));
           }
           break; 
      }
    },
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 2),
      child: Column(
              children: <Widget>[
                
              Expanded(child: this.icondata.icon),
              Text(
                this.icondata.title,textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF333333),
                  
                ),
              ),
            ],
          ),
    ),
  );
}



