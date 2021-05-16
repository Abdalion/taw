/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author egonb
 */
@Entity
@Table(name = "ESTUDIO_USUARIOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EstudioUsuarios.findAll", query = "SELECT e FROM EstudioUsuarios e")
    , @NamedQuery(name = "EstudioUsuarios.findById", query = "SELECT e FROM EstudioUsuarios e WHERE e.id = :id")})
public class EstudioUsuarios implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "ID_ESTUDIO", referencedColumnName = "ID")
    @ManyToOne
    private Estudio idEstudio;
    @JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID")
    @ManyToOne
    private UsuarioAuto idUsuario;

    public EstudioUsuarios() {
    }

    public EstudioUsuarios(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Estudio getIdEstudio() {
        return idEstudio;
    }

    public void setIdEstudio(Estudio idEstudio) {
        this.idEstudio = idEstudio;
    }

    public UsuarioAuto getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(UsuarioAuto idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EstudioUsuarios)) {
            return false;
        }
        EstudioUsuarios other = (EstudioUsuarios) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.EstudioUsuarios[ id=" + id + " ]";
    }
    
}
