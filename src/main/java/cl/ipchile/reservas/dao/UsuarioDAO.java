package cl.ipchile.reservas.dao;

import cl.ipchile.reservas.modelo.Usuario;
import cl.ipchile.reservas.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceException;
import java.util.List;

public class UsuarioDAO {

    public List<Usuario> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Usuario u ORDER BY u.id", Usuario.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void crear(Usuario u) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(u);
            tx.commit();
        } catch (PersistenceException pe) {
            if (tx.isActive()) tx.rollback();
            throw pe; // p. ej. email duplicado (UNIQUE)
        } finally {
            em.close();
        }
    }
}
