import 'package:flutter/material.dart';

import 'basictabs.dart';
import 'models/icon_itemload.dart';
import 'models/iconcategory.dart';

//화면을 연결하는 브릿지 프로그램: 탭명과 이후 수행하는 프로그램을 연결한다.
// 에이탭을 제일 번저 실행한다
List<BasicTabViewModel> tabcategories = [
  BasicTabViewModel(title: '주제별로 분류', widget: IconCategories()),  //위젯실행 /models/iconcategories.dart
  BasicTabViewModel(title: '장소별로 분류', widget: IconCategories()),
 
];
// .map((item) => DemoTabViewModel(
//   title: item.title,
//   widget: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[item.widget],
//   ),
// )).toList();

class BasicWidgets extends StatefulWidget {
  @override
  _BasicWidgetsState createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: tabcategories.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }
  // 여기서 탭부터 만들고 실행한다
  @override
  Widget build(BuildContext context) {
    return BasicTabs(                               
      title: 'Select Category You want',
      tabcategories: tabcategories,
      tabScrollable: true,
      tabController: this.tabController,
    );
  }
}

class IconCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: iconCategories.map((item) => IconItem(icondata: item)).toList(),  // models/icondaya.dart
    );
  }
}
