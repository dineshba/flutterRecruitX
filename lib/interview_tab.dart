import 'package:flutter/material.dart';
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
  final bool isMyInterview;
  final interviews = <Interview>[
    new Interview("Dinesh", "Dev", 3),
    new Interview("Ramesh", "Dev", 3),
    new Interview("Rajesh", "QA", 8),
    new Interview("Suresh", "BA", 5),
  ];

  _InterviewTab(this.isMyInterview);

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