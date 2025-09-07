package cl.ipchile.reservas.dao;

import cl.ipchile.reservas.modelo.Hotel;
import cl.ipchile.reservas.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class HotelDAO {

    public List<Hotel> listar() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT h FROM Hotel h ORDER BY h.id", Hotel.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void crear(Hotel h) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(h);
            tx.commit();
        } catch (RuntimeException e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
