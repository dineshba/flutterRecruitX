import 'dart:async';
import 'dart:convert' as JSON;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recruitx/interview.dart';
import 'package:recruitx/interview_card.dart';

class InterviewsTab extends StatefulWidget {
  InterviewsTab({Key key, this.isMyInterview}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _InterviewTab(isMyInterview);
  }

  final bool isMyInterview;
}

class _InterviewTab extends State<InterviewsTab> {
  bool isMyInterview;
  var interviews = <Interview>[];

  _InterviewTab(bool isMyInterview) {
    this.isMyInterview = isMyInterview;
    _setInterviews();
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
      itemBuilder: (context, index) {
        if (index < interviews.length) {
          var interview = interviews[index];
          var listTile = new ListTile(
            title: new InterviewCard(interview),
          );
          var container = new Container(
            padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: listTile,
          );
          var a = new Card(
            child: container,
          );
          return a;
        }
      },
    );
    return new Padding(
      padding: new EdgeInsets.only(top: 10.0),
      child: listView,
    );
  }

  void _setInterviews() {
    _fetchPost().then((interviews) {
      setState(() {
        this.interviews = interviews;
      });
    });
  }

  Future<List<Interview>> _fetchPost() async {
    final response = await http.get('http://127.0.0.1:4000/' +
        'interviews?panelist_login_name=dineshb&panelist_experience=10&panelist_role=ops&preload');
    final List<dynamic> jsonDecode = JSON.jsonDecode(response.body);
    List<Interview> interviews = jsonDecode.map((interview) {
      return Interview.fromJson(interview);
    }).toList();
    return interviews;
  }
}
