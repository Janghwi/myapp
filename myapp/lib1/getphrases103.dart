import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'getphrases10.dart';
import 'getphrases10j.dart';
import 'getphrases10k.dart';
import 'models/phrasesmodel.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GetPhrases103 extends StatelessWidget {
  final List<Phrases> phrases = [
    Phrases(
      eng: "snapshot.data[index].data['eng']",
      kor: "snapshot.data[index].data['kor']",
      korprn: "snapshot.data[index].data['korprn']",
      jap: "snapshot.data[index].data['jap']",
      japprn: "snapshot.data[index].data['japprn']",
    ),
  ];
  final String argument;

  GetPhrases103({Key key, this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    //listPage() {
   
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar view"),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "English"),
            Tab(text: "Korean"),
            Tab(text: "Japanese"),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            GetPhrases10(argument:'temphangul'), 
            GetPhrases10k(argument:'temphangul'),
            GetPhrases10j(argument:'temphangul'),
          ],
            
        ),
      ),
    );
  }
}


