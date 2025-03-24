package com.devBrandon.hospital.dto;

import lombok.*;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class HospitalRequestDTO {
    private int idHospital;
    private int idDistrito;
    private String nombre;
    private int antiguedad;
    private BigDecimal area;
    private int idSede;
    private int idGerente;
    private int idCondicion;
}
