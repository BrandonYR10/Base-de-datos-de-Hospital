package com.devBrandon.hospital.repository;
import java.math.BigDecimal;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HospitalRepository {

    @PersistenceContext
    private EntityManager entityManager;

    // Llama al procedimiento almacenado "registrar"
    public void registrarHospital(int idHospital, int idDistrito, String nombre, int antiguedad,
                                  BigDecimal area, int idSede, int idGerente, int idCondicion) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("pkg_hospital.registrar");
        query.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(4, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(5, BigDecimal.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(6, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(7, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(8, Integer.class, ParameterMode.IN);

        query.setParameter(1, idHospital);
        query.setParameter(2, idDistrito);
        query.setParameter(3, nombre);
        query.setParameter(4, antiguedad);
        query.setParameter(5, area);
        query.setParameter(6, idSede);
        query.setParameter(7, idGerente);
        query.setParameter(8, idCondicion);

        query.execute();
    }

    // Llama al procedimiento almacenado "actualizar"
    public void actualizarHospital(int idHospital, int idDistrito, String nombre, int antiguedad,
                                   double area, int idSede, int idGerente, int idCondicion) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("pkg_hospital.actualizar");
        query.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(4, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(5, Double.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(6, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(7, Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(8, Integer.class, ParameterMode.IN);

        query.setParameter(1, idHospital);
        query.setParameter(2, idDistrito);
        query.setParameter(3, nombre);
        query.setParameter(4, antiguedad);
        query.setParameter(5, area);
        query.setParameter(6, idSede);
        query.setParameter(7, idGerente);
        query.setParameter(8, idCondicion);

        query.execute();
    }

    // Llama al procedimiento almacenado "eliminar"
    public void eliminarHospital(int idHospital) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("pkg_hospital.eliminar");
        query.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
        query.setParameter(1, idHospital);
        query.execute();
    }

    // Llama al procedimiento almacenado "listar" y devuelve una lista de hospitales
    public List<Object[]> listarHospitales() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("pkg_hospital.listar");
        query.registerStoredProcedureParameter(1, void.class, ParameterMode.REF_CURSOR); // Cursor de salida
        query.execute();
        return query.getResultList();
    }

    // Llama al procedimiento almacenado "buscar_por_nombre"
    public List<Object[]> buscarHospitalPorNombre(String nombre) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("PKG_HOSPITAL.buscar_por_nombre");

        query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(2, void.class, ParameterMode.REF_CURSOR);

        query.setParameter(1, nombre);

        query.execute();
        return query.getResultList();
    }
}
