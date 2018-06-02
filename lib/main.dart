import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RecruitX',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(tabs: [
              new Tab(
                text: "All Interviews",
              ),
              new Tab(
                text: "My Interviews",
              )
            ]),
          ),
          body: new TabBarView(children: [
            new InterviewsTab(isMyInterview: false),
            new InterviewsTab(
              isMyInterview: true,
            )
          ]),
        ),
      ),
    );
  }
}

class InterviewsTab extends StatefulWidget {
  InterviewsTab({Key key, this.isMyInterview}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _InterviewTab(isMyInterview);
  }

  final bool isMyInterview;
}

class _InterviewTab extends State<InterviewsTab> {
  final bool isMyInterview;

  _InterviewTab(this.isMyInterview);

  @override
  Widget build(BuildContext context) {
    return isMyInterview ? new Text("My Interviews"): new Text("all Interviews");
  }
}
