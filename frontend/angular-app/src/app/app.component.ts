import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; // Importa CommonModule si usas *ngFor o *ngIf
import { RouterOutlet } from '@angular/router'; // Importa RouterOutlet si usas enrutamiento

@Component({
  selector: 'app-root',
  standalone: true, // Marca el componente como independiente
  imports: [CommonModule, RouterOutlet], // Importa los módulos necesarios
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {}