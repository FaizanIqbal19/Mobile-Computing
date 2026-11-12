import { Injectable } from '@angular/core';
import { Student } from '../models/student';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  // Mock initial data
  private students: Student[] = [
    { id: 1, name: 'Alice Smith', email: 'alice@example.com', age: 20, course: 'Computer Science' },
    { id: 2, name: 'Bob Jones', email: 'bob@example.com', age: 22, course: 'Mechanical Engineering' }
  ];

  // BehaviorSubject helps propagate data changes across components
  private studentList$ = new BehaviorSubject<Student[]>(this.students);

  getStudents(): Observable<Student[]> {
    return this.studentList$.asObservable();
  }

  addStudent(student: Student): void {
    student.id = this.students.length > 0 ? Math.max(...this.students.map(s => s.id)) + 1 : 1;
    this.students.push(student);
    this.studentList$.next([...this.students]); // Emit updated list
  }

  deleteStudent(id: number): void {
    this.students = this.students.filter(student => student.id !== id);
    this.studentList$.next([...this.students]); // Emit updated list
  }
}