import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(Sys());

class Sys extends StatelessWidget {
  const Sys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings route) {
        return MaterialPageRoute(
            settings: RouteSettings(name: MainPage.path),
            builder: (BuildContext context) => MainPage());
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String path = "/";

  @override
  Widget build(BuildContext context) =>
      kIsWeb ? MainWebPage() : MainMobilePage();
}

class Model {
  String txt;
  bool check;
  Model({required this.txt, this.check = false});

  void change(String newText) {
    this.txt = newText;
  }

  void changeCheck() {
    this.check = !this.check;
  }
}

class MainWebPage extends StatelessWidget {
  const MainWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MainMobilePage extends StatefulWidget {
  @override
  State<MainMobilePage> createState() => _MainMobilePageState();
}

class _MainMobilePageState extends State<MainMobilePage> {
  // const MainMobilePage({Key? key}) : super(key: key);
  List<Model>? todos; //null 이;후 [] // todo1..todo2...

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    this.controller.addListener(() {
      if (!this.mounted) return; //build함수가 끝났는지 체크
      this.setState(() {});
    });
    this.todos = [];
    if (!this.mounted) return;
    this.setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: this.controller.text.isEmpty
            ? null
            : FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  if (this.todos == null) return;
                  this.setState(() {
                    this.todos!.add(Model(txt: this.controller.text));
                  });
                  this.controller.clear();
                  // if (!this.controller.hasListeners) return;
                  print(this.controller.text);
                  // print(this.controller.text == '');
                },
              ),
        appBar: AppBar(
          title: Text('Todo'),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: TextField(controller: this.controller),
              ),
              Expanded(
                  child: this.todos == null
                      ? Center(
                          child: Text("Loading"),
                        )
                      : (this.todos!.isEmpty
                          ? Center(
                              child: Text("empty!"),
                            )
                          : ListView.builder(
                              itemCount: this.todos!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ListTile(
                                    title: Text(
                                      this.todos![index].txt.toString(),
                                      style: TextStyle(
                                        color: this.todos![index].check
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () async {
                                          bool check = await showDialog<bool>(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      AlertDialog(
                                                        title: Text("삭제"),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          true),
                                                              child:
                                                                  Text("제거")),
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          false),
                                                              child: Text("닫기"))
                                                        ],
                                                      )) ??
                                              false;
                                          if (!check) return;
                                          setState(() =>
                                              this.todos!.removeAt(index));
                                        },
                                        icon: Icon(Icons.delete)),
                                    onTap: () {
                                      // this.todos![index].check = !this.todos![index].check;
                                      setState(() {
                                        this.todos![index].changeCheck();
                                      });
                                    },
                                    onLongPress: () async {
                                      String updateData = await Navigator.of(
                                                  context)
                                              .push<String>(MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      new UpdatePage(
                                                          data: this
                                                              .todos![index]
                                                              .txt
                                                              .toString()))) ??
                                          "";
                                      if (updateData.isEmpty) return;
                                      setState(() {
                                        // this.todos![index].txt = updateData;
                                        this.todos![index].change(updateData);
                                      });
                                    },
                                  )))),
            ],
          ),
        ));
  }
}

class UpdatePage extends StatefulWidget {
  final String data;
  const UpdatePage({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController? controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.data);
    super.initState();
  }

  @override
  void dispose() {
    this.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextField(
              controller: this.controller,
            ),
            Container(
              child: Row(
                children: [
                  TextButton(
                    child: Text("변경"),
                    onPressed: () {
                      if (this.widget.data == this.controller!.text) {
                        return Navigator.of(context).pop();
                      }
                      return Navigator.of(context).pop(this.controller!.text);
                    },
                  ),
                  TextButton(
                    child: Text("취소"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
