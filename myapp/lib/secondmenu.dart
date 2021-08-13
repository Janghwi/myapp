import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

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

class SecondMenus extends StatefulWidget {
  @override
  _SecondMenusState createState() => _SecondMenusState();
}

class _SecondMenusState extends State<SecondMenus>
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
      title: '기본위젯',
      tabcategories: tabcategories,
      tabScrollable: true,
      tabController: this.tabController,
    );
  }
}
List<String> listHeader = 
[
'Basic          기본          表現',
'Questions',
'HEADER3',
'HEADER4',
'HEADER5',
'HEADER6',
'HEADER7',
'HEADER8',
'HEADER9',
'HEADER10',
];
List<String> listTitle = ['number','season','direction','time','transport','family'];
class IconCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return gridHeaderDisplay();
  }
}
Widget gridHeaderDisplay(){
    return new ListView.builder(itemCount: listHeader.length,itemBuilder: (context, index) {
      return new StickyHeader(
        header: new Container(
          height: 30.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerLeft,
          child: new Text(listHeader[index],
            style: const TextStyle(color: Colors.blueGrey, fontSize: 18,fontWeight: FontWeight.bold),
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
                margin: EdgeInsets.all(4.0),
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 2.0),
                  child: Center(
                    child: Text(listTitle[indx], style: TextStyle(fontSize: 15, color: Colors.black54),)),
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

Widget iconGridDisplay(){
      return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: iconCategories.map((item) => IconItem(icondata: item)).toList(),  // models/icondaya.dart
    );
}