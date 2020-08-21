import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TestWidget());
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: FlatButton(
                          splashColor: Colors.blueAccent,
                          color: Colors.green,
                          onPressed: () {
                            _pageController.animateToPage(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "One",
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: FlatButton(
                          splashColor: Colors.blueAccent,
                          color: Colors.yellow,
                          onPressed: () {
                            _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "Two",
                          ),
                        ),
                      ),
                      FlatButton(
                        splashColor: Colors.red,
                        color: Colors.red,
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "Three",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: PageView(
                controller: _pageController,
                children: [
                  Center(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.green,
                          child:
                              Text("Page One", textAlign: TextAlign.center))),
                  Center(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.yellow,
                          child: Text(
                            "Page Two",
                            textAlign: TextAlign.center,
                          ))),
                  Center(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.red,
                          child:
                              Text("Page Three", textAlign: TextAlign.center))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
