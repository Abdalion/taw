/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Estudio;
import gigdigger.entity.Evento;
import gigdigger.entity.Usuario;
import java.util.Collection;
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
public class EventoFacade extends AbstractFacade<Evento> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventoFacade() {
        super(Evento.class);
    }

    public List<Evento> findAforo() {
        Query q;
        List<Evento> lista;

        q = em.createQuery("Select e FROM Evento e WHERE e.aforo > 0");
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    }

    public List<Evento> findNoAforo() {
        Query q;
        List<Evento> lista;

        q = em.createQuery("Select e FROM Evento e WHERE e.aforo = 0");
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    }

    public List<Evento> findProximos() {
        Query q;
        List<Evento> lista;

        q = em.createQuery("Select e FROM Evento e WHERE e.fechaEvento >= CURRENT_DATE");
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    }

    public List<Evento> findTerminados() {
        Query q;
        List<Evento> lista;

        q = em.createQuery("Select e FROM Evento e WHERE e.fechaEvento < CURRENT_DATE");
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    }
    
        public List<Evento> findByCreador(Usuario creador) {
        Query q;
        List<Evento> lista;

        q = em.createQuery("SELECT e FROM Evento e WHERE e.idCreador.id = :idCreador");
        q.setParameter("idCreador", creador.getId());
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    
    }

}
