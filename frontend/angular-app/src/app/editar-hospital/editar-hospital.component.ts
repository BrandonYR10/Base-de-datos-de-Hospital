import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Para formularios template-driven
import { CrudService } from '../services/crud.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-editar-hospital',
  standalone: true,
  imports: [CommonModule, FormsModule], // Importa FormsModule para formularios
  templateUrl: './editar-hospital.component.html',
  styleUrls: ['./editar-hospital.component.css'],
})
export class EditarHospitalComponent implements OnInit {
  hospital = {
    idHospital: '',
    idDistrito: 0,
    nombre: '',
    antiguedad: 0,
    area: 0,
    idSede: 0,
    idGerente: 0,
    idCondicion: 0,
  };

  constructor(
    private crudService: CrudService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.crudService.getHospitales().subscribe((hospitales) => {
        const hospital = hospitales.find((h) => h.idHospital === +id);
        if (hospital) {
          this.hospital = hospital;
        }
      });
    }
  }

  onSubmit(): void {
    this.crudService.actualizarHospital(this.hospital).subscribe({
      next: () => {
        // Mostrar mensaje de éxito
        alert('¡Los cambios se guardaron correctamente!');
        
        // Redirigir después de guardar
        this.router.navigate(['/lista-hospitales']);
      },
      error: (err) => {
        console.error('Error al actualizar:', err);
        alert('Ocurrió un error al guardar los cambios');
      }
    });
  }
}