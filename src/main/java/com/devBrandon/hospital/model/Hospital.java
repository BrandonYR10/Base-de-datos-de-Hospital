package com.devBrandon.hospital.model;
import java.math.BigDecimal;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Hospital")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Hospital {

    @Id
    @Column(name = "idHospital")
    private int idHospital;

    @Column(name = "idDistrito")
    private int idDistrito;

    @Column(name = "Nombre")
    private String nombre;

    @Column(name = "Antiguedad")
    private int antiguedad;

    @Column(name = "Area")
    private BigDecimal area;

    @Column(name = "idSede")
    private int idSede;

    @Column(name = "idGerente")
    private int idGerente;

    @Column(name = "idCondicion")
    private int idCondicion;
}
