import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../dataread33.dart';
import '../getphrases04.dart';
import 'iconcategory.dart';

import 'package:sticky_headers/sticky_headers.dart';

class SubCatItem extends StatefulWidget {
  @override
  _SubCatItemState createState() => _SubCatItemState();
}

class _SubCatItemState extends State<SubCatItem> {

  List<String> listHeader = ['공항','쇼핑','장소','백화점','HEADER5','HEADER6','HEADER7','HEADER8','HEADER9','HEADER10',];
  List<String> listTitle = ['수속','택시잡기','장소찾기','버스타기',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Header Demo"),
      ),
      body: menuGetFromFirestore(),
    );
  }
  
  Widget menuGetFromFirestore(){
  //   StreamBuilder<DocumentSnapshot>(
  //    stream: Firestore.instance.collection("listofprods").document('ac1').snapshots(),
  //    builder: (context, snapshot) {
  //      if (!snapshot.hasData) return LinearProgressIndicator();

  //      return _gridHeader(context, snapshot.data.documents);
  //    },
  //  );
  }

  Widget gridHeader(){
    return new ListView.builder(itemCount: listHeader.length,itemBuilder: (context, index) {
      return new StickyHeader(
        header: new Container(
          height: 38.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerLeft,
          child: new Text(listHeader[index],
            style: const TextStyle(color: Colors.purple, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        content: Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listTitle.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1,),
            itemBuilder: (contxt, indx){
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    ),
                margin: EdgeInsets.all(4.0),
                color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 3.0, bottom: 2.0),
                  child: Center(child: Text(listTitle[indx], style: TextStyle(fontSize: 16, color: Colors.black45),)),
                ),
              );
            },
          ),
        ),
      );
    },
      shrinkWrap: true,
    );
  }
}