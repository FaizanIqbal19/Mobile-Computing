String getGrade(int marks) {
  if (marks >= 80) {
    return "A";
  } else if (marks >= 70) {
    return "B";
  } else if (marks >= 60) {
    return "C";
  } else if (marks >= 50) {
    return "D";
  } else {
    return "F";
  }
}

void main() {
  print("Marks: 85, Grade: ${getGrade(85)}");
  print("Marks: 75, Grade: ${getGrade(75)}");
  print("Marks: 45, Grade: ${getGrade(45)}");
}