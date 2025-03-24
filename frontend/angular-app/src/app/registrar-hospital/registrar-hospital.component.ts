import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Para formularios template-driven
import { CrudService } from '../services/crud.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registrar-hospital',
  standalone: true,
  imports: [CommonModule, FormsModule], // Importa FormsModule para formularios
  templateUrl: './registrar-hospital.component.html',
  styleUrls: ['./registrar-hospital.component.css'],
})
export class RegistrarHospitalComponent {
  hospital = {
    idHospital: 0, // Este campo puede ser omitido si se genera automáticamente en el backend
    idDistrito: 0,
    nombre: '',
    antiguedad: 0,
    area: 0,
    idSede: 0,
    idGerente: 0,
    idCondicion: 0,
  };

  constructor(private crudService: CrudService, private router: Router) {}

  onSubmit(): void {
    // Usando el nombre correcto del método (agregarHospital)
    this.crudService.agregarHospital(this.hospital).subscribe({
      next: () => {
        alert('Hospital registrado con éxito!');
        this.router.navigate(['/lista-hospitales']);
      },
      error: (err) => {
        console.error('Error al registrar:', err);
        alert('Error al registrar hospital');
      }
    });
  }
}