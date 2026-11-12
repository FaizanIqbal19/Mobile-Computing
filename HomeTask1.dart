
class Student {
  String name;
  int rollNo;
  double cgpa;

  Student(this.name, this.rollNo, this.cgpa);
}

void main() {
  List<Student> students = [
    Student("Faizan Iqbal", 2502141, 3.5),
    Student("Ali", 101, 2.8),
    Student("Ahmed", 102, 3.2),
    Student("Usman", 103, 3.7),
  ];

  print("All Students:");
  for (var s in students) {
    print("Name: ${s.name}, Roll No: ${s.rollNo}, CGPA: ${s.cgpa}");
  }

  print("\nStudents with CGPA 3.0 or higher:");
  for (var s in students) {
    if (s.cgpa >= 3.0) {
      print("${s.name} - ${s.cgpa}");
    }
  }

  double total = 0;
  for (var s in students) {
    total += s.cgpa;
  }

  double average = total / students.length;
  print("\nAverage CGPA: ${average.toStringAsFixed(2)}");
}
