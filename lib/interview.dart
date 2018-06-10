import 'package:intl/intl.dart';

class Interview {
  final String candidateName;
  final String role;
  final double _experience;
  final DateTime _startDateTime;
  final String name;
  final String skills;
  final bool signUpStatus;

  Interview(this.name, this.candidateName, this.skills, this.role,
      this._experience, this._startDateTime, this.signUpStatus);

  String get nameAndSkill {
    return this.name + ":" + this.skills;
  }

  String get date {
    Intl.defaultLocale = 'en_US';
    final today = new DateTime.now().day;
    if (_startDateTime.day == today) {
      return "Today";
    } else if (_startDateTime.day == today + 1) {
      return "Tomorrow";
    } else {
      var formatter = new DateFormat('yyyy-MM-dd');
      return formatter.format(_startDateTime);
    }
  }

  String get time {
    Intl.defaultLocale = 'en_US';
    var formatter = new DateFormat('jm');
    return formatter.format(_startDateTime);
  }

  String get experience {
    return "(" + _experience.toString() + " Yrs)";
  }

  factory Interview.fromJson(Map<String, dynamic> interview) {
    final String candidateName = interview['candidate']['first_name'] +
        interview['candidate']['last_name'];
    final String candidateSkills = interview['candidate']['skills'];
    final String role = interview['candidate']['role']['name'];
    var name = interview['interview_type_id']["name"];
    final signUpStatus = interview['signup'];
    final String experience = interview['candidate']['experience'];
    var startDateTime = DateTime.parse(interview['start_time']).toLocal();
    return new Interview(name, candidateName, candidateSkills, role,
        double.parse(experience), startDateTime, signUpStatus);
  }
}
