import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { StudentService } from '../../services/student';
import { Student } from '../../models/student';
import { Router } from '@angular/router';

@Component({
  selector: 'app-student-add',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './student-add.html',
  styleUrls: ['./student-add.css']
})
export class StudentAddComponent {
  newStudent: Student = { id: 0, name: '', email: '', age: 18, course: '' };

  constructor(private studentService: StudentService, private router: Router) {}

  onSubmit(): void {
    if (this.newStudent.name && this.newStudent.email) {
      this.studentService.addStudent({ ...this.newStudent });
      this.router.navigate(['/students']); // Redirect back to list
    }
  }
}