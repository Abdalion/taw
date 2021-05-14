/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Estudio;
import gigdigger.entity.EstudioUsuarios;
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
public class EstudioUsuariosFacade extends AbstractFacade<EstudioUsuarios> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstudioUsuariosFacade() {
        super(EstudioUsuarios.class);
    }

    public EstudioUsuarios findByEstudio(Estudio estudio) {
        Query q;
        q = em.createQuery("SELECT e FROM EstudioUsuarios e WHERE e.idEstudio = :idEstudio");
        q.setParameter("idEstudio", estudio);
        
        List<EstudioUsuarios> lista;
        
        lista = q.getResultList();
        if(lista != null && !lista.isEmpty()){
            return lista.get(0);
        }else{
            return null;
        }
    }
    
}
