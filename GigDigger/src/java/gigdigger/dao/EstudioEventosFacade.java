/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Estudio;
import gigdigger.entity.EstudioEventos;
import gigdigger.entity.EstudioUsuarios;
import gigdigger.entity.Evento;
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
public class EstudioEventosFacade extends AbstractFacade<EstudioEventos> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstudioEventosFacade() {
        super(EstudioEventos.class);
    }

    public EstudioEventos findByEstudio(Estudio estudio) {
        Query q;
        q = em.createQuery("SELECT e FROM EstudioEventos e WHERE e.idEstudio = :idEstudio");
        q.setParameter("idEstudio", estudio);
        
        List<EstudioEventos> lista;
        
        lista = q.getResultList();
        if(lista != null && !lista.isEmpty()){
            return lista.get(0);
        }else{
            return null;
        }
    }
    
    public List<EstudioEventos> findEventosByEstudio(Estudio estudio) {
        Query q;
        q = em.createQuery("SELECT e FROM EstudioEventos e WHERE e.idEstudio.id = :idEstudio");
        q.setParameter("idEstudio", estudio.getId());
        
        List<EstudioEventos> lista;
        
        lista = q.getResultList();
        if(lista != null && !lista.isEmpty()){
            return lista;
        }else{
            return null;
        }
    }
    
}
