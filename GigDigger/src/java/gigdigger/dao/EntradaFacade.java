/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Entrada;
import gigdigger.entity.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ruben
 */
@Stateless
public class EntradaFacade extends AbstractFacade<Entrada> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EntradaFacade() {
        super(Entrada.class);
    }

    public List<Entrada> findByEventoId(Integer eventoId) {
        Query q;
        q = em.createQuery("SELECT e FROM Entrada e WHERE e.idEvento.id = :eventoId");
        q.setParameter("eventoId", eventoId);

        if (q.getResultList().isEmpty()) {
            return null;
        } else {
            return q.getResultList();
        }
    }

    public List<Entrada> findByUserId(Integer userId) {
        Query q;
        q = em.createQuery("SELECT e FROM Entrada e WHERE e.idUsuario.id = :userId");
        q.setParameter("userId", userId);

        if (q.getResultList().isEmpty()) {
            return null;
        } else {
            return q.getResultList();
        }
    }

}
