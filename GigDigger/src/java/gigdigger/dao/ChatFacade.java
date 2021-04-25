/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

import gigdigger.entity.Chat;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ruben
 */
@Stateless
public class ChatFacade extends AbstractFacade<Chat> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ChatFacade() {
        super(Chat.class);
    }
    
    public Chat findCurrentChat (Integer idUser){
        Query q;
        q = em.createQuery("SELECT c FROM Chat c WHERE c.idUsuario.id = :idUser AND c.fechaFin IS NULL");
        q.setParameter("idUser", idUser);
        
        return (Chat) q.getResultList().get(0);
    }
    
    public Chat findById (Integer id){
        Query q;
        q = em.createQuery("SELECT c FROM Chat c WHERE c.id = :id");
        q.setParameter("id", id);
        
        return (Chat) q.getResultList().get(0);        
    }
}
