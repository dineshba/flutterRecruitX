import 'package:flutter/material.dart';
import 'package:recruitx/interview_tab.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RecruitX',
      theme: new ThemeData(
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
