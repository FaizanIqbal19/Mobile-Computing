import { Routes } from '@angular/router';
import { StudentListComponent } from './components/student-list/student-list';
import { StudentAddComponent } from './components/student-add/student-add';

export const routes: Routes = [
  { path: 'students', component: StudentListComponent },
  { path: 'add-student', component: StudentAddComponent },
  { path: '', redirectTo: '/students', pathMatch: 'full' } // Default route
];