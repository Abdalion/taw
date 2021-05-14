/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.UsuarioAuto;
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
public class UsuarioAutoFacade extends AbstractFacade<UsuarioAuto> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioAutoFacade() {
        super(UsuarioAuto.class);
    }

    public List<UsuarioAuto> findMenores() {
        Query q;
        q = em.createQuery("SELECT u FROM UsuarioAuto u WHERE u.edad < 18");
        
        List<UsuarioAuto> lista;
        
        lista = q.getResultList();
        
        if(lista!=null && !lista.isEmpty()){
            return lista;
        }else{
            return null;
        }
    }

    public List<UsuarioAuto> findMayores() {
        Query q;
        q = em.createQuery("SELECT u FROM UsuarioAuto u WHERE u.edad >= 18");
        
        List<UsuarioAuto> lista;
        
        lista = q.getResultList();
        
        if(lista!=null && !lista.isEmpty()){
            return lista;
        }else{
            return null;
        }
    }
    
}
