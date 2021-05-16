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
 * @author jesus
 */
@Entity
@Table(name = "ESTUDIO_EVENTOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EstudioEventos.findAll", query = "SELECT e FROM EstudioEventos e")
    , @NamedQuery(name = "EstudioEventos.findById", query = "SELECT e FROM EstudioEventos e WHERE e.id = :id")})
public class EstudioEventos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "ID_ESTUDIO", referencedColumnName = "ID")
    @ManyToOne
    private Estudio idEstudio;
    @JoinColumn(name = "ID_EVENTO", referencedColumnName = "ID")
    @ManyToOne
    private Evento idEvento;

    public EstudioEventos() {
    }

    public EstudioEventos(Integer id) {
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

    public Evento getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Evento idEvento) {
        this.idEvento = idEvento;
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
        if (!(object instanceof EstudioEventos)) {
            return false;
        }
        EstudioEventos other = (EstudioEventos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.EstudioEventos[ id=" + id + " ]";
    }
    
}
