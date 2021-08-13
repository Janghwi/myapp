import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'models/languageprovider.dart';
import 'models/menucategory.dart';
import 'router/routing_constants.dart';

//import 'package:opentrivia/ui/pages/home.dart';

class SecondMenu10 extends StatelessWidget {
  final String argument;

  SecondMenu10({Key key, this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(iconSize: 20, items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.black38),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favorites"),
            backgroundColor: Colors.black38),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            backgroundColor: Colors.black38),
        BottomNavigationBarItem(
            icon: Icon(Icons.transform),
            title: Text("Translate"),
            backgroundColor: Colors.black38),
      ]),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null),
              title: Text('Categories'),
              floating: true,
              pinned: true,
              expandedHeight: 70,
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: MyFlexiableAppBar(),
              // ),
            ),
            SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: true,
                child: listPage(context))
          ],
        ),
      ),
      // routes: {
      //   "view01": (context) => GetPhrases13(screenTitle: 'abc', firestoreName: 'weather'),
      // 'cat2_view': (context) =>
      //     GetPhrases12(screenTitle: 'abc', firestoreName: 'weather'),
      //},
    );
  }

  Widget listPage(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final pokeSize = screenSize.width * 0.65;
    final pokeTop = -(screenSize.width * 0.19);
    final pokeRight = -(screenSize.width * 0.48);

    Future _data;

    Future getMenus() async {
      var firestore = Firestore.instance;
      QuerySnapshot snapshot =
          await firestore.collection(argument).orderBy('id').getDocuments();
      snapshot.documents.forEach((document) {
        // print (document);
        //  print (snapshot.documents);
      });
      return snapshot.documents;
    }

    _data = getMenus();
    //print('pressed');

    final langSet = Provider.of<LanguageLoad>(context, listen: true);

    return AnimatedContainer(
      width: screenSize.width,
      duration: Duration(seconds: 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.amber.withAlpha(0),
            Colors.amber[100],
            Colors.amber[200]
          ],
        ),
      ),
      child: FutureBuilder(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading"),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data.length,
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
              itemBuilder: (_, index) {
                return MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      // print(menuCategories[index].routeName);
                      // print(menuCategories.length);
                      return Navigator.pushNamed(context, PhraseViewRoute,
                          arguments: secondMenuCategories[index].routeName);
                      //return Navigator.push(context, menuCategories[index].routeName);
                    },
                    //color: Colors.blue[100 * (index % 9)],
                    color: Color(0xFF4FC1A6),
                    splashColor: Colors.white10,
                    highlightColor: Colors.white10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 18,
                            right: 2,
                            left: 72,
                            bottom: 8,
                            child: Icon(
                          secondMenuCategories[index].icon,
                          //.fiber_pin,
                          color: Colors.blueGrey,
                        ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data[index].data['id'].toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black45,
                                      letterSpacing: 2.0,
                                      wordSpacing: 5.0),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  snapshot
                                      .data[index].data['${langSet.langSet}'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      letterSpacing: 2.0,
                                      wordSpacing: 3.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            );
          }
        },
      ),
    );
  }
}
