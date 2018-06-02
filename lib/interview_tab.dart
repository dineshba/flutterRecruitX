import 'dart:async';
import 'dart:convert' as JSON;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recruitx/interview.dart';

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
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return new Divider();
        }
        var i = index ~/ 2;
        if (i < interviews.length) {
          var interview = interviews[i];
          return new ListTile(
            title: new InterviewCard(interview),
          );
        }
      },
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
        'interviews?panelist_login_name=dineshb&panelist_experience=10&panelist_role=ops');
    final List<dynamic> jsonDecode = JSON.jsonDecode(response.body);
    List<Interview> interviews = jsonDecode.map((interview) {
      return Interview.fromJson(interview);
    }).toList();
    return interviews;
  }
}

class InterviewCard extends StatelessWidget {
  final Interview interview;

  InterviewCard(this.interview);

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        new Row(
          children: [
            new Text(interview.candidateName),
            new Expanded(
              child: new Text(
                interview.role,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        new Row(children: [
          new Text(
            interview.experience.toString() + " Yrs",
          ),
        ])
      ],
    );
  }
}
