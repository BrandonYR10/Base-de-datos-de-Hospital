package com.devBrandon.hospital.dto;
import java.math.BigDecimal;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class HospitalDTO {
    private int idHospital;
    private String nombre;
    private String descDistrito;
    private String descSede;
    private String descGerente;
    private String descCondicion;
}

