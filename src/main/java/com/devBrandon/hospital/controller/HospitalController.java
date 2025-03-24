package com.devBrandon.hospital.controller;

import com.devBrandon.hospital.dto.HospitalDTO;
import com.devBrandon.hospital.dto.HospitalRequestDTO;
import com.devBrandon.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/hospital")
@CrossOrigin(origins = "*") // Permitir llamadas desde cualquier origen
public class HospitalController {

    @Autowired
    private HospitalService hospitalService;

    // Registrar hospital
    @PostMapping("/registrar")
    public String registrarHospital(@RequestBody HospitalRequestDTO hospital) {
        hospitalService.registrarHospital(hospital);
        return "Hospital registrado correctamente.";
    }

    // Actualizar hospital
    @PutMapping("/actualizar")
    public String actualizarHospital(@RequestBody HospitalRequestDTO hospital) {
        hospitalService.actualizarHospital(hospital);
        return "Hospital actualizado correctamente.";
    }

    // Eliminar hospital
    @DeleteMapping("/eliminar/{id}")
    public String eliminarHospital(@PathVariable int id) {
        hospitalService.eliminarHospital(id);
        return "Hospital eliminado correctamente.";
    }

    // Listar hospitales con DTO
    @GetMapping("/listar")
    public List<HospitalDTO> listarHospitales() {
        return hospitalService.listarHospitales();
    }

    // Buscar hospital por nombre con DTO
    @GetMapping("/buscar")
    public List<HospitalDTO> buscarHospitalPorNombre(@RequestParam String nombre) {
        return hospitalService.buscarHospitalPorNombre(nombre);
    }
}
