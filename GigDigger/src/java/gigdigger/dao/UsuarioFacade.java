/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.dao;

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
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "GigDiggerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    /*
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findById", query = "SELECT u FROM Usuario u WHERE u.id = :id")
    , @NamedQuery(name = "Usuario.findByNombreUsuario", query = "SELECT u FROM Usuario u WHERE u.nombreUsuario = :nombreUsuario")
    , @NamedQuery(name = "Usuario.findByEmail", query = "SELECT u FROM Usuario u WHERE u.email = :email")
    , @NamedQuery(name = "Usuario.findByPassword", query = "SELECT u FROM Usuario u WHERE u.password = :password")
    , @NamedQuery(name = "Usuario.findByRol", query = "SELECT u FROM Usuario u WHERE u.rol = :rol")
    , @NamedQuery(name = "Usuario.findTeleoperadorLibre", query = "SELECT u FROM Usuario u WHERE u.rol LIKE 'TELEOPERADOR' AND (SELECT COUNT(c)FROM Chat c WHERE c.fechaFin IS NULL AND c.idTeleoperador = u.id)<2")
    
    */
    public Usuario findByID (Integer id){
        Query q;
        q = em.createQuery("SELECT u FROM Usuario u WHERE u.id = :id");
        q.setParameter("id", id);
        
        return (Usuario) q.getResultList().get(0);
    }
    
    public Usuario findTeleoperadorLibre (){
        Query q;
        q = em.createQuery("SELECT u FROM Usuario u WHERE u.rol LIKE 'TELEOPERADOR' AND "
                + "SELECT COUNT(c)FROM Chat c WHERE c.fechaFin IS NULL AND c.idTeleoperador = u.id)<2");
        
        return (Usuario) q.getResultList().get(0);
    }
    
    public List<Usuario> findByRol (String rol){
        Query q;
        
        if(rol.equals("CREADOR") || rol.equals("AUTOREGISTRADO") || 
                rol.equals("ADMINISTRADOR") || rol.equals("TELEOPERADOR") || rol.equals("ANALISTA")){
            
            q = em.createQuery("SELECT u FROM Usuario u WHERE u.rol = :rol");
            q.setParameter("rol", rol);

            return q.getResultList();
            
        } else {
            return null;
        }
        
    }
    
    public int countChats (Integer id){
        
        Query q;
        
        q = em.createQuery("SELECT COUNT(c) FROM Chat c WHERE c.fechaFin IS NULL AND c.idTeleoperador = :id");
        q.setParameter("id", id);
        
        return (int) q.getSingleResult();
    }
    
}
