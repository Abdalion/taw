/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ruben
 */
@Entity
@Table(name = "ETIQUETA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Etiqueta.findAll", query = "SELECT e FROM Etiqueta e")
    , @NamedQuery(name = "Etiqueta.findById", query = "SELECT e FROM Etiqueta e WHERE e.id = :id")
    , @NamedQuery(name = "Etiqueta.findByEtiqueta", query = "SELECT e FROM Etiqueta e WHERE e.etiqueta = :etiqueta")})
public class Etiqueta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "ETIQUETA", nullable = false, length = 50)
    private String etiqueta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEtiqueta")
    private Collection<EtiquetaEvento> etiquetaEventoCollection;

    public Etiqueta() {
    }

    public Etiqueta(Integer id) {
        this.id = id;
    }

    public Etiqueta(Integer id, String etiqueta) {
        this.id = id;
        this.etiqueta = etiqueta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    @XmlTransient
    public Collection<EtiquetaEvento> getEtiquetaEventoCollection() {
        return etiquetaEventoCollection;
    }

    public void setEtiquetaEventoCollection(Collection<EtiquetaEvento> etiquetaEventoCollection) {
        this.etiquetaEventoCollection = etiquetaEventoCollection;
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
        if (!(object instanceof Etiqueta)) {
            return false;
        }
        Etiqueta other = (Etiqueta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.Etiqueta[ id=" + id + " ]";
    }
    
}
