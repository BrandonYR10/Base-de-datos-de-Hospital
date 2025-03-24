import { Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { CrudComponent } from './crud/crud/crud.component';
import { ListaHospitalesComponent } from './lista-hospitales/lista-hospitales.component';
import { RegistrarHospitalComponent } from './registrar-hospital/registrar-hospital.component';
import { EditarHospitalComponent } from './editar-hospital/editar-hospital.component';

export const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  //{ path: 'crud', component: CrudComponent },
  { path: 'lista-hospitales', component: ListaHospitalesComponent },
  { path: 'registrar-hospital', component: RegistrarHospitalComponent },
  { path: 'editar-hospital/:id', component: EditarHospitalComponent },
];