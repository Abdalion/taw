/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.EstudioUsuarios;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    
}
