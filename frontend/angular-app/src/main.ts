import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { provideRouter } from '@angular/router';
import { routes } from './app/app.routes';
import { provideHttpClient } from '@angular/common/http'; // Importa provideHttpClient para usar HttpClient

bootstrapApplication(AppComponent, {
  providers: [
    provideRouter(routes), // Proporciona las rutas
    provideHttpClient(), // Proporciona HttpClient
  ],
}).catch((err) => console.error(err));