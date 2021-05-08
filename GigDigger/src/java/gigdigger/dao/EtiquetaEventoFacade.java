/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.EtiquetaEvento;
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
public class EtiquetaEventoFacade extends AbstractFacade<EtiquetaEvento> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EtiquetaEventoFacade() {
        super(EtiquetaEvento.class);
    }

    /**
     *
     * @param id
     */
    public void removeByIdEvento(Integer id) {
        Query q;
        
        q = em.createNativeQuery("DELETE FROM FASA.ETIQUETA_EVENTO WHERE ID_EVENTO = "+id);
        
        q.executeUpdate();
    }    
    
}
