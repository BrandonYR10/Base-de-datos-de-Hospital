package com.devBrandon.hospital.service;
import java.math.BigDecimal;

import com.devBrandon.hospital.dto.HospitalDTO;
import com.devBrandon.hospital.dto.HospitalRequestDTO;
import com.devBrandon.hospital.repository.HospitalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class HospitalService {

    @Autowired
    private HospitalRepository hospitalRepository;

    // Listar hospitales con DTO
    public List<HospitalDTO> listarHospitales() {
        List<Object[]> resultados = hospitalRepository.listarHospitales();

        return resultados.stream().map(obj -> new HospitalDTO(
                ((BigDecimal) obj[0]).intValue(),  // Convertir de BigDecimal a Integer
                (String) obj[1],   // nombre
                (String) obj[2],   // descDistrito
                (String) obj[3],   // descSede
                (String) obj[4],   // descGerente
                (String) obj[5]    // descCondicion
        )).collect(Collectors.toList());
    }

    // Buscar hospital por nombre con DTO
    public List<HospitalDTO> buscarHospitalPorNombre(String nombre) {
        List<Object[]> resultados = hospitalRepository.buscarHospitalPorNombre(nombre);

        return resultados.stream().map(obj -> new HospitalDTO(
                ((BigDecimal) obj[0]).intValue(),  // idHospital
                (String) obj[1],   // nombre
                (String) obj[2],   // descDistrito
                (String) obj[3],   // descSede
                (String) obj[4],   // descGerente
                (String) obj[5]    // descCondicion
        )).collect(Collectors.toList());
    }

    // Registrar un hospital
    public void registrarHospital(HospitalRequestDTO hospital) {
        hospitalRepository.registrarHospital(
                hospital.getIdHospital(),
                hospital.getIdDistrito(),
                hospital.getNombre(),
                hospital.getAntiguedad(),
                hospital.getArea(),
                hospital.getIdSede(),
                hospital.getIdGerente(),
                hospital.getIdCondicion()
        );
    }

    // Actualizar un hospital
    public void actualizarHospital(HospitalRequestDTO hospital) {
        hospitalRepository.actualizarHospital(
                hospital.getIdHospital(),
                hospital.getIdDistrito(),
                hospital.getNombre(),
                hospital.getAntiguedad(),
                hospital.getArea().doubleValue(),
                hospital.getIdSede(),
                hospital.getIdGerente(),
                hospital.getIdCondicion()
        );
    }

    // Eliminar un hospital
    public void eliminarHospital(int idHospital) {
        hospitalRepository.eliminarHospital(idHospital);
    }
}
