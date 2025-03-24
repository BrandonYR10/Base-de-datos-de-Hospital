import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root', // Esto hace que el servicio esté disponible en toda la aplicación
})
export class CrudService {
  private apiUrl = 'http://localhost:8080/api/hospital'; // URL base de tu backend

  constructor(private http: HttpClient) {}

  // Obtener todos los hospitales
  //getHospitales(): Observable<any[]> {
  //  return this.http.get<any[]>(`${this.apiUrl}/listar`);
  //}
  getHospitales(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/listar`).pipe(
      map((response: any[]) => {
        // Verificar que los datos tengan la estructura esperada
        return response.map(item => ({
          idHospital: item.idHospital,
          nombre: item.nombre,
          descDistrito: item.descDistrito || 'N/A',
          descSede: item.descSede || 'N/A',
          descGerente: item.descGerente || 'N/A',
          descCondicion: item.descCondicion || 'N/A'
        }));
      })
    );
  }

  agregarHospital(hospital: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/registrar`, hospital, {
      headers: { 'Content-Type': 'application/json' },
    });
  }
  
  actualizarHospital(hospital: any): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/actualizar`, hospital, {
      headers: { 'Content-Type': 'application/json' },
    });
  }

  // Eliminar un hospital
  eliminarHospital(idHospital: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/eliminar/${idHospital}`);
  }
}