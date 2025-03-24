import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true, // Marca el componente como independiente
  imports: [FormsModule], // Importa FormsModule aquí
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';
  staticUser = { username: 'admin', password: 'admin' }; // Usuario estático

  constructor(private router: Router) {}

  login() {
    if (this.username === this.staticUser.username && this.password === this.staticUser.password) {
      this.router.navigate(['/lista-hospitales']); // Redirige a la página de CRUD
    } else {
      alert('Usuario o contraseña incorrectos');
    }
  }
}