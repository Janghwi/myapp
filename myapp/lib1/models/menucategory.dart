import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuCategory{
  final int id;
  //final String name;
  final String firestoreName;
  final dynamic icon;
  MenuCategory(this.id, this.firestoreName, {this.icon});
}

 List<MenuCategory> menuCategories = [
  MenuCategory(1,"menu11", icon: FontAwesomeIcons.baby),
  MenuCategory(2,"could.you",  icon: FontAwesomeIcons.handshake),
  MenuCategory(3,"weather", icon: FontAwesomeIcons.planeDeparture),
  MenuCategory(4,"wordtest3",  icon: FontAwesomeIcons.businessTime),
  MenuCategory(5,"menu1", icon: FontAwesomeIcons.newspaper),
  MenuCategory(6,"menu1", icon: FontAwesomeIcons.music),
  MenuCategory(7,"menu1",  icon: FontAwesomeIcons.tablets),
  MenuCategory(8,"menu1", icon: FontAwesomeIcons.store),
  MenuCategory(9,"menu1",  icon: FontAwesomeIcons.democrat),
  MenuCategory(10,"menu1", icon: FontAwesomeIcons.youtube),
  MenuCategory(11,"menu1", icon: FontAwesomeIcons.youtube),
];

class SecondMenuCategory{
  final int id;
  //final String name;
  final String routeName;
  final dynamic icon;
  SecondMenuCategory(this.id, this.routeName, {this.icon});
}

 List<SecondMenuCategory> secondMenuCategories = [
  SecondMenuCategory(1,"weather", icon: FontAwesomeIcons.baby),
  SecondMenuCategory(2,"view02",  icon: FontAwesomeIcons.handshake),
  SecondMenuCategory(3,"view03", icon: FontAwesomeIcons.planeDeparture),
  SecondMenuCategory(4,"view04",  icon: FontAwesomeIcons.businessTime),
  SecondMenuCategory(5,"view05", icon: FontAwesomeIcons.newspaper),
  SecondMenuCategory(6,"view06", icon: FontAwesomeIcons.music),
  SecondMenuCategory(7,"view07",  icon: FontAwesomeIcons.tablets),
  SecondMenuCategory(8,"view08", icon: FontAwesomeIcons.store),
  SecondMenuCategory(9,"view09",  icon: FontAwesomeIcons.democrat),
  SecondMenuCategory(10,"view010", icon: FontAwesomeIcons.youtube),
];