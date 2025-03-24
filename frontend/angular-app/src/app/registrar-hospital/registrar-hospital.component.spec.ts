import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrarHospitalComponent } from './registrar-hospital.component';

describe('RegistrarHospitalComponent', () => {
  let component: RegistrarHospitalComponent;
  let fixture: ComponentFixture<RegistrarHospitalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RegistrarHospitalComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegistrarHospitalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
