package cl.ipchile.reservas;

import cl.ipchile.reservas.modelo.Usuario;
import cl.ipchile.reservas.util.JPAUtil;

import javax.persistence.EntityManager;

public class TestJPA {
    public static void main(String[] args) {
        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            System.out.println("✅ Conexión JPA inicializada correctamente.");

            Long total = em.createQuery("SELECT COUNT(u) FROM Usuario u", Long.class)
                    .getSingleResult();
            System.out.println("Usuarios en BD: " + total);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) em.close();
            JPAUtil.close();
        }
    }
}
