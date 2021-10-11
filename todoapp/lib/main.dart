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
  List<String?>? todos; //null 이;후 [] // todo1..todo2...

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    this.controller.addListener(() {
      if (!this.mounted) return; //build함수가 끝났는지 체크
      this.setState(() {});

      this.todos = [];
      if (!this.mounted) return;
      setState(() {});
    });

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
              child: Icon(Icons.plus_one),
              onPressed: () {
                if (this.todos == null) return;
                this.setState(() {
                  this.todos!.add(this.controller.text);
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
                          child: Text("empty"),
                        )
                      : ListView.builder(
                          itemCount: this.todos!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            child: Text(this.todos![index]!),
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
