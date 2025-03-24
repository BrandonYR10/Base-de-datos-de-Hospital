import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CrudService } from '../../services/crud.service'; // Importa el servicio

@Component({
  selector: 'app-crud',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './crud.component.html',
  styleUrls: ['./crud.component.css'],
})
export class CrudComponent implements OnInit {
  hospitales: any[] = []; // Almacena los hospitales obtenidos del backend
  nuevoHospital: any = { // Objeto para almacenar un nuevo hospital
    idHospital: 0,
    idDistrito: 0,
    nombre: '',
    antiguedad: 0,
    area: 0,
    idSede: 0,
    idGerente: 0,
    idCondicion: 0,
  };
  editIndex = -1; // Índice del hospital que se está editando
  editHospitalId: number | null = null; // ID del hospital que se está editando

  constructor(private crudService: CrudService) {} // Inyecta el servicio

  ngOnInit(): void {
    this.cargarHospitales(); // Carga los hospitales al iniciar el componente
  }

  // Cargar todos los hospitales desde el backend
  cargarHospitales(): void {
    this.crudService.getHospitales().subscribe({
      next: (data) => (this.hospitales = data),
      error: (err) => console.error('Error al cargar los hospitales:', err),
    });
  }

  // Agregar un nuevo hospital
  agregarHospital(): void {
    this.crudService.agregarHospital(this.nuevoHospital).subscribe({
      next: () => {
        this.cargarHospitales(); // Recarga los hospitales después de agregar uno nuevo
        this.limpiarFormulario(); // Limpia el formulario
      },
      error: (err) => console.error('Error al agregar el hospital:', err),
    });
  }

  // Editar un hospital
  editarHospital(index: number): void {
    this.editIndex = index;
    this.editHospitalId = this.hospitales[index].idHospital; // Asigna el ID del hospital que se está editando
    this.nuevoHospital = { ...this.hospitales[index] }; // Copia los datos del hospital al formulario
  }

  // Actualizar un hospital existente
  actualizarHospital(): void {
    if (this.editHospitalId !== null) {
      this.crudService.actualizarHospital(this.nuevoHospital).subscribe({
        next: () => {
          this.cargarHospitales(); // Recarga los hospitales después de actualizar
          this.limpiarFormulario(); // Limpia el formulario
          this.editIndex = -1; // Restablece el índice de edición
          this.editHospitalId = null; // Restablece el ID de edición
        },
        error: (err) => console.error('Error al actualizar el hospital:', err),
      });
    }
  }

  // Eliminar un hospital
  eliminarHospital(idHospital: number): void {
    this.crudService.eliminarHospital(idHospital).subscribe({
      next: () => this.cargarHospitales(), // Recarga los hospitales después de eliminar
      error: (err) => console.error('Error al eliminar el hospital:', err),
    });
  }

  // Limpiar el formulario
  limpiarFormulario(): void {
    this.nuevoHospital = {
      idHospital: 0,
      idDistrito: 0,
      nombre: '',
      antiguedad: 0,
      area: 0,
      idSede: 0,
      idGerente: 0,
      idCondicion: 0,
    };
  }
}