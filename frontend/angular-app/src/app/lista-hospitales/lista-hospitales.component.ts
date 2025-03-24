import { Component, OnInit } from '@angular/core';
import { CrudService } from '../services/crud.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common'; // Importa CommonModule para directivas como *ngFor
import { RouterModule } from '@angular/router'; // Importación crucial
@Component({
  selector: 'app-lista-hospitales',
  standalone: true, // Marca el componente como standalone
  imports: [CommonModule], // Importa módulos necesarios
  templateUrl: './lista-hospitales.component.html',
  styleUrls: ['./lista-hospitales.component.css'],
})
export class ListaHospitalesComponent implements OnInit {
  hospitales: any[] = [];

  navigateToRegister(): void {
    this.router.navigate(['/registrar-hospital']); // Asegúrate que esta ruta coincida con tu configuración
  }

  constructor(private crudService: CrudService, private router: Router) {}

  ngOnInit(): void {
    this.cargarHospitales();
  }

  //
  //cargarHospitales(): void {
   // this.crudService.getHospitales().subscribe(
  //    (data) => {
  //      this.hospitales = data;
   //   },
   //   (error) => {
   //     console.error('Error al cargar los hospitales:', error);
   //   }
   // );
  //}
  
  cargarHospitales(): void {
    this.crudService.getHospitales().subscribe({
      next: (data) => {
        console.log('Datos crudos:', data);
        this.hospitales = data;
        console.log('Datos mapeados:', this.hospitales);
      },
      error: (err) => console.error('Error:', err)
    });
  }


  eliminarHospital(idHospital: number): void {
    if (confirm('¿Estás seguro de eliminar este hospital?')) {
      this.crudService.eliminarHospital(idHospital).subscribe(
        () => {
          alert('Hospital eliminado correctamente');
          this.cargarHospitales();
        },
        (error) => {
          console.error('Error al eliminar el hospital:', error);
        }
      );
    }
  }

  editarHospital(idHospital: number): void {
    this.router.navigate([`/editar-hospital/${idHospital}`]);
  }

  registrarHospital(): void {
    this.router.navigate(['/registrar-hospital']);
  }
}