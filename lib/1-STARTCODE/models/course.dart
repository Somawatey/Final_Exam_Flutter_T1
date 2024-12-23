class Course {
  final String name;
  final List<StudentScore> studentScores;
  Course({
    required this.name,
    required this.studentScores,
  });
}
class StudentScore {
  final String name;
  final double score;

  StudentScore({
    required this.name,
    required this.score,
  });
}