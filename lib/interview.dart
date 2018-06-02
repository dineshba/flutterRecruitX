class Interview {
  final String candidateName;
  final String role;
  final double experience;

  Interview(this.candidateName, this.role, this.experience);

  factory Interview.fromJson(Map<String, dynamic> interview) {
    final String name = interview['candidate']['first_name'] + interview['candidate']['last_name'];
    final String role = interview['candidate']['role_id'];
    final String experience = interview['candidate']['experience'];
    return new Interview(name, role, double.parse(experience));
  }
}
