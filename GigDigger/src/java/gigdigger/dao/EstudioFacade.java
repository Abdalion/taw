/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Estudio;
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
public class EstudioFacade extends AbstractFacade<Estudio> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstudioFacade() {
        super(Estudio.class);
    }

    public List<Estudio> findByCreador(Usuario creador) {
        Query q;
        List<Estudio> lista;

        q = em.createQuery("SELECT e FROM Estudio e WHERE e.creadorEstudio.id = :idCreador");
        q.setParameter("idCreador", creador.getId());
        lista = q.getResultList();

        if (lista != null && !lista.isEmpty()) {
            return lista;
        } else {
            return null;
        }
    
    }
    
}
