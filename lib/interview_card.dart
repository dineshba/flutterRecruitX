import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitx/interview.dart';

class InterviewCard extends StatelessWidget {
  final Interview interview;

  InterviewCard(this.interview);

  @override
  Widget build(BuildContext context) {
    var secondRow =
        new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      new Text(
        interview.nameAndSkill,
        style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0),
      ),
      new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          var alertDialog = new CupertinoAlertDialog(
            title: new Text(
              "SignUp!",
              textAlign: TextAlign.center,
            ),
            content: new Text("Do you want to singup ?"),
            actions: [
              new CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("SignUp"),
              ),
              new CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("No"),
              )
            ],
          );
          showDialog(
              context: context,
              builder: (context) {
                return alertDialog;
              });
        },
        child: new Text("SignUp"),
      ),
    ]);
    var firstRow = new Row(
      children: [
        new Expanded(
          child: new Text(
            interview.candidateName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        new Text(interview.experience,
            style: new TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontSize: 10.0)),
        new Expanded(
          child: new Padding(
            padding: new EdgeInsets.only(left: 5.0),
            child: new Text(
              interview.date,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.only(left: 5.0),
          child: new Text(
            "  " + interview.time,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
    return new Column(
      children: [
        firstRow,
        new Padding(
          padding: new EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: secondRow,
        )
      ],
    );
  }
}
